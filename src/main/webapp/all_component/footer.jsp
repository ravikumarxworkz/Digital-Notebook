<style>
.footer {
    box-shadow: 0 -5px 20px rgba(0, 0, 0, 0.1);
    position: relative;
    overflow: hidden;
}

.footer::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, rgba(255,255,255,0.2), rgba(255,255,255,0.8), rgba(255,255,255,0.2));
}

.footer p {
    font-size: 0.95rem;
    letter-spacing: 0.5px;
}

.footer i {
    opacity: 0.8;
}
</style>
<div class="container-fluid footer mt-5 py-4" style="background: linear-gradient(135deg, #0061a8, #0077b6);">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                <p class="mb-0 text-white fw-light">
                    <i class="fas fa-code me-2"></i>Designed and Developed by <span class="fw-bold">Ravikumar</span>
                </p>
            </div>
            <div class="col-md-6 text-center text-md-end">
                <p class="mb-0 text-white fw-light">
                    <i class="far fa-copyright me-2"></i>All Rights Reserved <span class="fw-bold">2024-25</span>
                </p>
            </div>
        </div>
    </div>
</div>