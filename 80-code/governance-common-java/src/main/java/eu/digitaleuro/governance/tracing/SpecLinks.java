/*
 * artefact_type: implementation
 * visibility: public
 * audience: everyone
 * form: source
 * role: governance
 * status: normative
 * owner: eurosystem
 *
 * DISCLAIMER:
 * The code in this folder is **illustrative and educational**.
 * It does not represent official implementations, production-ready components,
 * or endorsed technical approaches for the Digital Euro or any other real-world system.
 */
package eu.digitaleuro.governance.tracing;

import java.lang.annotation.*;

/**
 * Container for repeated {@link SpecLink} declarations.
 *
 * <p>
 * Java requires a container annotation for any {@code @Repeatable} type. It is
 * not written by hand: declaring {@code @SpecLink} twice on the same element
 * makes the compiler wrap both in this container, and tooling reads them back
 * through it.
 * </p>
 *
 * <p>
 * One code element often implements more than one requirement, so repetition is
 * the normal case rather than the exception.
 * </p>
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE, ElementType.METHOD, ElementType.FIELD})
public @interface SpecLinks {

    /**
     * The repeated links declared on the annotated element.
     */
    SpecLink[] value();
}
