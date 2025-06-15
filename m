Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C116ADA10E
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Jun 2025 06:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X2qW72oZ/Ev6dxVY4XjpPYtmkfGWvRI6rXmh2mU2ydE=; b=IS8V3LZcxevz8SzZYnvC2bi2rN
	gfBLgIWB/jyWWrtRLRU+JI0Q1+dVALLcnzrTWYaoZaJBPXF2xkAlgEcQDwYbx8QAZRZAAHQkQKD+2
	0NKhVi1tC6CSwbEQVg2lxAKy/2QPyIMTgS2klq80OlJjv5sl7NqJJQnNMF6gPG0NXMPA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uQfNR-0000TF-1q;
	Sun, 15 Jun 2025 04:53:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uQfNP-0000T9-TT
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Jun 2025 04:53:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ehat2ZSrQr1gCyGC8v7FJXXUICcQLrjl3bZgAk7qcwE=; b=K4pBJk1GAllg7dHOfUn6RVAR1Y
 is32aEJgkJVSG6ZOSmbuL8zI/75nx37Yp5IessZRw5miXvomaJqSUeOrhXeHLVleK4ScJjvfSkK+j
 y7eLnpayN5L1MpHDoosSoBzJWg2TJpEEfAZfX7Tq89bjnBotCCY95+Ww837ASmtuHWG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ehat2ZSrQr1gCyGC8v7FJXXUICcQLrjl3bZgAk7qcwE=; b=X
 9pkPHw8/Z2OwlQsg7GdOdpvQsF6zxagStuEgBfDFjkfVToFwMH0vK7itO43x4rBsbI5of/qc2rdJK
 IpcyrV/PBLPHiwZ1F1TqdWGqLjKMpcLD6u2BUw2fJxM9Dyl/tS1UtI86tXTjoSoZ2hJ3BR6AL43iM
 r6ulp9Q2AG3JIAig=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uQfNP-0008D5-7l for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Jun 2025 04:53:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CAA0B4A7A8;
 Sun, 15 Jun 2025 04:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560C4C4CEE3;
 Sun, 15 Jun 2025 04:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749963225;
 bh=jKskpqcoXOguF1H1TjZ0pWmBZVDnOT0/xNqcoD0cSAE=;
 h=From:To:Cc:Subject:Date:From;
 b=Ho4jYYIKxZ5jOqawvrhaEPBhEZPCrM8ChRozSncyaAqNV+riPwKkyanQnMEwAdbVm
 /XRV6xyzV0raa/vd5Vhy6VpZ8GrTZtwKLpy7aNs7hKsQojtsMYvTe4DMgacX8pDInr
 a0nfAZcxldXCif58iYfsInWiFqV6glddb5yOs9caUGyMCurbwn84kg4SOsvfVqmUGB
 Wo3qxBpEPl9p0JEvf41ii0/lxxoogeSXHuFEhDZ2/SG3fUxUxujR9c7exo5bBPUZzE
 GPlWpZSiPtJDcT+Br/m9zwgcOyyBKtPXd8G/lx6adWU0CoQnHdvVGNZu/NSTRtgW+q
 /J7vgLI1jS06A==
To: linux-fscrypt@vger.kernel.org
Date: Sat, 14 Jun 2025 21:51:45 -0700
Message-ID: <20250615045145.224567-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Make fscrypt no
 longer
 use Crypto API drivers for non-inline crypto accelerators, even when the
 Crypto API prioritizes them over CPU-based code (which unfortunately it often
 does). These drivers tend [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uQfNP-0008D5-7l
Subject: [f2fs-dev] [PATCH v2] fscrypt: don't use problematic non-inline
 crypto accelerators
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Make fscrypt no longer use Crypto API drivers for non-inline crypto
accelerators, even when the Crypto API prioritizes them over CPU-based
code (which unfortunately it often does).  These drivers tend to be
really problematic, especially for fscrypt's synchronous workload.

Specifically, exclude drivers that have CRYPTO_ALG_KERN_DRIVER_ONLY or
CRYPTO_ALG_ALLOCATES_MEMORY set.  (Later, CRYPTO_ALG_ASYNC should be
excluded too.  That's omitted for now to keep this commit backportable,
since until recently some CPU-based code had CRYPTO_ALG_ASYNC set.)

There are two major issues with these drivers: bugs and performance.

First, these drivers tend to be buggy.  They're fundamentally much more
error-prone and harder to test than the CPU-based code, and they often
don't get tested before kernel releases.  Released drivers have
en/decrypted data incorrectly.  These bugs cause real issues for fscrypt
users who often didn't even want to use these drivers, for example:

- https://github.com/google/fscryptctl/issues/32
- https://github.com/google/fscryptctl/issues/9
- https://lore.kernel.org/r/PH0PR02MB731916ECDB6C613665863B6CFFAA2@PH0PR02MB7319.namprd02.prod.outlook.com

These drivers have also caused issues for dm-crypt users, including data
corruption and deadlocks.  Since Linux v5.10, dm-crypt has disabled most
of these drivers by excluding CRYPTO_ALG_ALLOCATES_MEMORY.

Second, the CPU-based crypto tends to be faster, often *much* faster.
This may seem counterintuitive, but benchmarks clearly show it.  There's
a *lot* of overhead associated with going to a hardware driver, off the
CPU, and back again.  Measuring synchronous AES-256-XTS encryption of
4096-byte messages (fscrypt's workload) on two platforms with non-inline
crypto accelerators that I have access to:

  Intel Emerald Rapids server:

     xts-aes-vaes-avx512:  16171 MB/s  [CPU-based, Vector AES]
     xts(ecb(aes-generic)):  305 MB/s  [CPU-based, generic C code]
     qat_aes_xts:            289 MB/s  [Offload, Intel QuickAssist]

  Qualcomm SM8650 HDK:

     xts-aes-ce:            4301 MB/s  [CPU-based, ARMv8 Crypto Extensions]
     xts(ecb(aes-generic)):  265 MB/s  [CPU-based, generic C code]
     xts-aes-qce:             73 MB/s  [Offload, Qualcomm Crypto Engine]

So, using the "accelerators" is over 50 times slower than just using the
CPU.  Not only that, it's even slower than the generic C code, which
suggests that even on platforms whose CPUs lack AES instructions the
performance benefit of any accelerator would be marginal at best.

The usefulness of the accelerators could be improved with a different
software architecture that allows blocks to be efficiently en/decrypted
in parallel.  But fscrypt does not do that today, and even the async
support in the Crypto API isn't really all that efficient.  And even if
the accelerator was used perfectly efficiently, it seems unlikely to
help on small I/O requests, for which latency is really important.

As of this writing, the Crypto API prioritizes qat_aes_xts over
xts-aes-vaes-avx512.  Therefore, this commit greatly improves fscrypt
performance on Intel servers that have QAT and the QAT driver enabled.
qat_aes_xts is going to be deprioritized in the Crypto API (like I did
for xts-aes-qce recently too).  But as this seems to be a common pattern
with all the "accelerators", fscrypt should just disable all of them.

An argument that has been given in favor of non-inline crypto
accelerators is that they can protect keys in hardware.  But fscrypt
does not take advantage of that, so it is irrelevant.  (Also, it would
be quite difficult for fscrypt to do that.)

Note that fscrypt does support inline encryption engines, using raw or
hardware-wrapped keys.  These actually do work well and are widely used.
These do not use the "Crypto API" and are unaffected by this commit.

Fixes: b30ab0e03407 ("ext4 crypto: add ext4 encryption facilities")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---

Changed in v2:
- Improved commit message and comment
- Dropped CRYPTO_ALG_ASYNC from the mask, to make this patch
  backport-friendly
- Added Fixes and Cc stable

 fs/crypto/fscrypt_private.h | 16 ++++++++++++++++
 fs/crypto/hkdf.c            |  2 +-
 fs/crypto/keysetup.c        |  3 ++-
 fs/crypto/keysetup_v1.c     |  3 ++-
 4 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index c1d92074b65c5..0e95c7a095d49 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -43,10 +43,26 @@
  * hardware-wrapped keys has made it misleading as it's only for raw keys.
  * Don't use it in kernel code; use one of the above constants instead.
  */
 #undef FSCRYPT_MAX_KEY_SIZE
 
+/*
+ * This mask is passed as the third argument to the crypto_alloc_*() functions
+ * to prevent fscrypt from using the Crypto API drivers for non-inline crypto
+ * accelerators.  Those drivers have been problematic for fscrypt.  fscrypt
+ * users have reported hangs and even incorrect en/decryption with these
+ * drivers.  Since going to the driver, off CPU, and back again is really slow,
+ * such drivers can be over 50 times slower than the CPU-based code for
+ * fscrypt's synchronous workload.  Even on platforms that lack AES instructions
+ * on the CPU, any performance benefit is likely to be marginal at best.
+ *
+ * Note that fscrypt also supports inline encryption engines.  Those don't use
+ * the Crypto API and work much better than non-inline accelerators.
+ */
+#define FSCRYPT_CRYPTOAPI_MASK \
+	(CRYPTO_ALG_ALLOCATES_MEMORY | CRYPTO_ALG_KERN_DRIVER_ONLY)
+
 #define FSCRYPT_CONTEXT_V1	1
 #define FSCRYPT_CONTEXT_V2	2
 
 /* Keep this in sync with include/uapi/linux/fscrypt.h */
 #define FSCRYPT_MODE_MAX	FSCRYPT_MODE_AES_256_HCTR2
diff --git a/fs/crypto/hkdf.c b/fs/crypto/hkdf.c
index 0f3028adc9c72..5b9c21cfe2b45 100644
--- a/fs/crypto/hkdf.c
+++ b/fs/crypto/hkdf.c
@@ -56,11 +56,11 @@ int fscrypt_init_hkdf(struct fscrypt_hkdf *hkdf, const u8 *master_key,
 	struct crypto_shash *hmac_tfm;
 	static const u8 default_salt[HKDF_HASHLEN];
 	u8 prk[HKDF_HASHLEN];
 	int err;
 
-	hmac_tfm = crypto_alloc_shash(HKDF_HMAC_ALG, 0, 0);
+	hmac_tfm = crypto_alloc_shash(HKDF_HMAC_ALG, 0, FSCRYPT_CRYPTOAPI_MASK);
 	if (IS_ERR(hmac_tfm)) {
 		fscrypt_err(NULL, "Error allocating " HKDF_HMAC_ALG ": %ld",
 			    PTR_ERR(hmac_tfm));
 		return PTR_ERR(hmac_tfm);
 	}
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 0d71843af9469..d8113a7196979 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -101,11 +101,12 @@ fscrypt_allocate_skcipher(struct fscrypt_mode *mode, const u8 *raw_key,
 			  const struct inode *inode)
 {
 	struct crypto_skcipher *tfm;
 	int err;
 
-	tfm = crypto_alloc_skcipher(mode->cipher_str, 0, 0);
+	tfm = crypto_alloc_skcipher(mode->cipher_str, 0,
+				    FSCRYPT_CRYPTOAPI_MASK);
 	if (IS_ERR(tfm)) {
 		if (PTR_ERR(tfm) == -ENOENT) {
 			fscrypt_warn(inode,
 				     "Missing crypto API support for %s (API name: \"%s\")",
 				     mode->friendly_name, mode->cipher_str);
diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
index b70521c55132b..158ceae8a5bce 100644
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@ -50,11 +50,12 @@ static int derive_key_aes(const u8 *master_key,
 {
 	int res = 0;
 	struct skcipher_request *req = NULL;
 	DECLARE_CRYPTO_WAIT(wait);
 	struct scatterlist src_sg, dst_sg;
-	struct crypto_skcipher *tfm = crypto_alloc_skcipher("ecb(aes)", 0, 0);
+	struct crypto_skcipher *tfm =
+		crypto_alloc_skcipher("ecb(aes)", 0, FSCRYPT_CRYPTOAPI_MASK);
 
 	if (IS_ERR(tfm)) {
 		res = PTR_ERR(tfm);
 		tfm = NULL;
 		goto out;

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
