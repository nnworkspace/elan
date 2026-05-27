/*
 * artefact_type: code
 * visibility: public
 * audience:
 *   - PSP
 *   - NCB
 * form: source
 * role: implementation
 * status: normative
 * owner: External PSP
 *
 * DISCLAIMER:
 * The code in this folder is **illustrative and educational**.
 * It does not represent official implementations, production-ready components,
 * or endorsed technical approaches for the Digital Euro or any other real-world system.
 *
 * PURPOSE:
 * This component serves as a reference implementation to demonstrate how technical
 * specifications are refined into code while maintaining strict auditability,
 * traceability, and mechanical governance across distinct institutional boundaries.
 * This structure enables automated compliance verification and live impact analysis.
 */

import express, { Request, Response } from 'express';
import { SpecLink } from 'governance-common';
import { LiquidityService } from './LiquidityService';

const app = express();
const port = 3000;

app.use(express.json());

@SpecLink({ spec_id: "SPEC-PSP-CORE", ref_id: "REQ-PSP-APP-01", version: "0.1" })
class PspApplication {

    /**
     * @SpecLink { spec_id: "SPEC-ONBOARDING", ref_id: "REQ-PSP-ONB-01", version: "0.1" }
     */
    static handleOnboarding(req: Request, res: Response) {
        console.log('Received onboarding request:', req.body);
        
        const { switch_consent } = req.body;

        if (switch_consent === true) {
            // Rule AM-011-004: Switching Flow
            console.log('Switching User Identity from remote PSP...');
            // Logic to call OP-OB-03 (SwitchUserPSP) would go here
            res.json({ status: 'SWITCH_INITIATED', user_id: 'USER-123', old_psp_notified: true });
        } else {
            // Rule ONB-03: New Registration
            console.log('Registering New User Identity...');
            // Logic to call OP-OB-01 (RegisterUserHash) would go here
            res.json({ status: 'REGISTRATION_INITIATED', user_id: 'USER-123' });
        }
    }

    static async handlePayment(req: Request, res: Response) {
        const amount = req.body.amount || 1000;
        console.log(`Processing payment of ${amount}...`);

        // Simulate shortfall detection
        await LiquidityService.performReverseWaterfall(amount);

        res.json({ status: 'PAID', amount });
    }

    static async handleLimitCheck(req: Request, res: Response) {
        const excess = req.body.excess || 500;
        console.log(`Checking holding limit... Excess: ${excess}`);

        // Simulate limit breach
        await LiquidityService.performWaterfall(excess);

        res.json({ status: 'LIMIT_ENFORCED', defunded: excess });
    }
}

app.post('/onboard', PspApplication.handleOnboarding);
app.post('/pay', PspApplication.handlePayment);
app.post('/check-limit', PspApplication.handleLimitCheck);

app.listen(port, () => {
    console.log(`PSP Mock listening at http://localhost:${port}`);
});
