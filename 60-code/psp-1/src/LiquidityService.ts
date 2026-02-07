
import { SpecLink } from 'governance-common';

// Simulation of Core Banking System (Zone A)
class CoreBankingSystem {
    static lockFunds(amount: number): string {
        console.log(`[CBS] Locking ${amount} cents.`);
        return "LOCK-" + Math.random().toString(36).substr(2, 9);
    }

    static captureFunds(lockId: string): void {
        console.log(`[CBS] Capturing lock ${lockId}.`);
    }

    static creditFunds(amount: number): void {
        console.log(`[CBS] Crediting ${amount} cents.`);
    }

    static voidLock(lockId: string): void {
        console.log(`[CBS] Voiding lock ${lockId}.`);
    }
}

// Simulation of Gateway Client
class GatewayClient {
    static async requestFunding(amount: number, proof: string): Promise<boolean> {
        console.log(`[GWY] Requesting Funding: ${amount} (Proof: ${proof})`);
        return true; // Simulate success
    }

    static async requestDefunding(amount: number): Promise<boolean> {
        console.log(`[GWY] Requesting Defunding: ${amount}`);
        return true; // Simulate success
    }
}

@SpecLink({ spec_id: "SPEC-LIQ-FUNC", ref_id: "REQ-LIQ-FUNC-01", version: "0.1" })
export class LiquidityService {

    /**
     * Reverse Waterfall: Funding Operation
     * Trigger: Payment Shortfall
     * Logic: Lock (CBS) -> Fund (DESP) -> Capture (CBS)
     */
    @SpecLink({ spec_id: "SPEC-LIQ-FUNC", ref_id: "TR-LIQ-01", version: "0.1" })
    static async performReverseWaterfall(shortfallAmount: number) {
        console.log(`Starting Reverse Waterfall for ${shortfallAmount}...`);

        // 1. Internal Lock
        const lockId = CoreBankingSystem.lockFunds(shortfallAmount);

        // 2. External Fund
        const success = await GatewayClient.requestFunding(shortfallAmount, lockId);

        if (success) {
            // 3. Capture
            CoreBankingSystem.captureFunds(lockId);
            console.log("Reverse Waterfall Complete: SETTLED");
        } else {
            // Rollback
            CoreBankingSystem.voidLock(lockId);
            console.log("Reverse Waterfall Failed: ROLLED_BACK");
        }
    }

    /**
     * Waterfall: Defunding Operation
     * Trigger: Holding Limit Breach
     * Logic: Defund (DESP) -> Credit (CBS)
     */
    @SpecLink({ spec_id: "SPEC-LIQ-FUNC", ref_id: "REQ-LIQ-FUNC-04", version: "0.1" })
    static async performWaterfall(excessAmount: number) {
        console.log(`Starting Waterfall for ${excessAmount}...`);

        // 1. External Defund
        const success = await GatewayClient.requestDefunding(excessAmount);

        if (success) {
            // 2. Internal Credit
            CoreBankingSystem.creditFunds(excessAmount);
            console.log("Waterfall Complete: SETTLED");
        } else {
            console.log("Waterfall Failed: RETRY_LATER");
        }
    }
}
