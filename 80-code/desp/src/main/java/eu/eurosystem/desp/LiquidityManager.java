package eu.eurosystem.desp;

import eu.digitaleuro.governance.tracing.SpecLink;
import org.springframework.stereotype.Service;

@Service
@SpecLink(specId = "SPEC-LIQ-FUNC", refId = "REQ-LIQ-RULES-001", version = "0.1")
public class LiquidityManager {

    @SpecLink(specId = "SPEC-LIQ-FUNC", refId = "TR-LIQ-04", version = "0.1")
    public void mintDigitalEuro(long amount, String proof) {
        if (amount <= 0) {
            throw new IllegalArgumentException("Amount must be positive");
        }
        System.out.println("[CORE] Minting " + amount + " cents against proof: " + proof);
        // In a real system, we would verify the proof here.
        System.out.println("[CORE] Liability Created: " + amount);
    }

    @SpecLink(specId = "SPEC-LIQ-FUNC", refId = "REQ-LIQ-FUNC-05", version = "0.1")
    public void burnDigitalEuro(long amount) {
        if (amount <= 0) {
            throw new IllegalArgumentException("Amount must be positive");
        }
        System.out.println("[CORE] Burning " + amount + " cents.");
        System.out.println("[CORE] Liability Reduced: " + amount);
    }
}
