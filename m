Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B44541BD5A5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2020 09:21:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iWgvpSt1tQCHLVwpnc7IbHx1ZTaMvwu2CV0dcZQjp0o=; b=FXFBatuvjclvvHhcUkYgWwTU8
	6kcnT3sivUwpAxtu+f3/QM0PSaIZzYr43aP82ARM85kbpdxigtM5mTRucuNIg+X6MkoUUvRiaBeDC
	cJs7zeqPypjWuA/KrPSbEBgLyphYda7DVc0uNuWktK2qVGW9eaDVGnq5c1Gw5mZWuL2Rg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jTh2J-0004G9-FT; Wed, 29 Apr 2020 07:21:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3-SqpXgYKAO4iQjoQjWeeWbU.Sec@flex--satyat.bounces.google.com>)
 id 1jTh2H-0004Fx-57
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Apr 2020 07:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B5+eMuXSNPgzz6lDCnDEgxrLUrZaLtLqUz74Q0MALlk=; b=kmbNNbsRhZyo8/teRk4i2R8Y/
 mrI8+Uwpw1cKh65CBOZJq6Q/CfZUzvc7keTHfi4seTA9WccXaUc49ePKR8bXJl1YHfFtAzGIJoWM/
 TvZXp/iKl4RV9ayOaQwosf7iYnsNRy1qg+e1h7sllkYLJ2eo7zx4EPD/ZY2XCeJOYZpgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B5+eMuXSNPgzz6lDCnDEgxrLUrZaLtLqUz74Q0MALlk=; b=klxbW++oOdoHtEuzpcSZ7+7igw
 RW36yJDEDyAhEhmddeAdcP9Pq8PMx2OEptxp2kwqpQJADU3+LvJMbDHgn+5m2MgP+J+JvoqvSk1ub
 quPHIRl9A8MmaC0d6bsS5qRd46kpfSi95Ljho5r6JMLPy5NXXkdoQPy8ame5pAE6JFeQ=;
Received: from mail-qv1-f73.google.com ([209.85.219.73])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTh2F-001yx3-7D
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Apr 2020 07:21:37 +0000
Received: by mail-qv1-f73.google.com with SMTP id ce16so184532qvb.15
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Apr 2020 00:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=B5+eMuXSNPgzz6lDCnDEgxrLUrZaLtLqUz74Q0MALlk=;
 b=sAqJzUcKRR2PWCgfoNL8YLcvvURrO/v1iW6vUz7lJffdr6y43Uzzz0AxEPCTCDJ23y
 7LrlyEKJbh0DYTJU1okrDwybkxKYrmkIlEoKYzl4uiUJAJ5iZpTMO1Ye2MtiZSGTOwKv
 f6VMtRrkd5eLHtQM7CCdLozYgNV9RIF3EUe6Gi44gKissWxndQH0mcAfJ50xgyX7Unoq
 4VGL1PLMNsJ7rPdqlnUbbwQXMPjkb6EVJ+wBfYA2wgmiD29UPFcD+86eF+CgjF6mL/4/
 mk2plw+YTq/16aDPBYSfEXGqOcyjNw5hJLZx5TFC2EEEzfKvRB13MkoEWYIqkxgHEO+j
 +teQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=B5+eMuXSNPgzz6lDCnDEgxrLUrZaLtLqUz74Q0MALlk=;
 b=r9hdu4IVaze+oes1OEM7NUiX3eWrpJjB+tUlzR7Nh5Xv6A/FdLLDzxnmZZzept9/3t
 +3NAHwstyG5+VzgESRvnDsRPUlMLMf1+Xzt29peuAIRDZ25dmp8jsYL55phDKK/eu94u
 84gtWxCUCJucaqF+zomKjOd19imdS/qFU+PiBhG61aMDHInKtu70tUM71ygfvjQ6rLjX
 ip8nZBCdjqiy4D1PqdJZAVjoeoa1qeVO2f8TLEqr0rnIldXagXCeUVb13oV5O+vJEK7t
 iXvlCvuCJEJfdU48JT0l9flj2I5CTLKlzsuCkqbDUiESb+NRZqs3zSees/b9YYnWCRDX
 dY0Q==
X-Gm-Message-State: AGi0PuZVfogRK1SsTgbKZh+UG2jMeULl8ARCTKtvlImF3W2xhb4rbDED
 ZxP8WmgVgES4BEGUMzIInZdJ8toln94=
X-Google-Smtp-Source: APiQypKEypcJIU7KUN7k5t+VIu3Cuza9yDDpu2lxe7BkycUVTw7yusdBevL+9YdhRGGMD9tDgpUBgB+0ObI=
X-Received: by 2002:a0c:aadc:: with SMTP id g28mr32584810qvb.0.1588144889029; 
 Wed, 29 Apr 2020 00:21:29 -0700 (PDT)
Date: Wed, 29 Apr 2020 07:21:10 +0000
In-Reply-To: <20200429072121.50094-1-satyat@google.com>
Message-Id: <20200429072121.50094-2-satyat@google.com>
Mime-Version: 1.0
References: <20200429072121.50094-1-satyat@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.73 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.73 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jTh2F-001yx3-7D
Subject: [f2fs-dev] [PATCH v11 01/12] Documentation: Document the blk-crypto
 framework
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Kuohong Wang <kuohong.wang@mediatek.com>,
 Satya Tangirala <satyat@google.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kim Boojin <boojin.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The blk-crypto framework adds support for inline encryption. There
are numerous changes throughout the storage stack. This patch documents
the main design choices in the block layer, the API presented to users
of the block layer (like fscrypt or layered devices) and the API presented
to drivers for adding support for inline encryption.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 Documentation/block/index.rst             |   1 +
 Documentation/block/inline-encryption.rst | 260 ++++++++++++++++++++++
 2 files changed, 261 insertions(+)
 create mode 100644 Documentation/block/inline-encryption.rst

diff --git a/Documentation/block/index.rst b/Documentation/block/index.rst
index 3fa7a52fafa46..026addfc69bc9 100644
--- a/Documentation/block/index.rst
+++ b/Documentation/block/index.rst
@@ -14,6 +14,7 @@ Block
    cmdline-partition
    data-integrity
    deadline-iosched
+   inline-encryption
    ioprio
    kyber-iosched
    null_blk
diff --git a/Documentation/block/inline-encryption.rst b/Documentation/block/inline-encryption.rst
new file mode 100644
index 0000000000000..81bd081a1a722
--- /dev/null
+++ b/Documentation/block/inline-encryption.rst
@@ -0,0 +1,260 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+Inline Encryption
+=================
+
+Background
+==========
+
+Inline encryption hardware sits logically between memory and the disk, and can
+en/decrypt data as it goes in/out of the disk. Inline encryption hardware has a
+fixed number of "keyslots" - slots into which encryption contexts (i.e. the
+encryption key, encryption algorithm, data unit size) can be programmed by the
+kernel at any time. Each request sent to the disk can be tagged with the index
+of a keyslot (and also a data unit number to act as an encryption tweak), and
+the inline encryption hardware will en/decrypt the data in the request with the
+encryption context programmed into that keyslot. This is very different from
+full disk encryption solutions like self encrypting drives/TCG OPAL/ATA
+Security standards, since with inline encryption, any block on disk could be
+encrypted with any encryption context the kernel chooses.
+
+
+Objective
+=========
+
+We want to support inline encryption (IE) in the kernel.
+To allow for testing, we also want a crypto API fallback when actual
+IE hardware is absent. We also want IE to work with layered devices
+like dm and loopback (i.e. we want to be able to use the IE hardware
+of the underlying devices if present, or else fall back to crypto API
+en/decryption).
+
+
+Constraints and notes
+=====================
+
+- IE hardware has a limited number of "keyslots" that can be programmed
+  with an encryption context (key, algorithm, data unit size, etc.) at any time.
+  One can specify a keyslot in a data request made to the device, and the
+  device will en/decrypt the data using the encryption context programmed into
+  that specified keyslot. When possible, we want to make multiple requests with
+  the same encryption context share the same keyslot.
+
+- We need a way for upper layers like filesystems to specify an encryption
+  context to use for en/decrypting a struct bio, and a device driver (like UFS)
+  needs to be able to use that encryption context when it processes the bio.
+
+- We need a way for device drivers to expose their inline encryption
+  capabilities in a unified way to the upper layers.
+
+
+Design
+======
+
+We add a :c:type:`struct bio_crypt_ctx` to :c:type:`struct bio` that can
+represent an encryption context, because we need to be able to pass this
+encryption context from the upper layers (like the fs layer) to the
+device driver to act upon.
+
+While IE hardware works on the notion of keyslots, the FS layer has no
+knowledge of keyslots - it simply wants to specify an encryption context to
+use while en/decrypting a bio.
+
+We introduce a keyslot manager (KSM) that handles the translation from
+encryption contexts specified by the FS to keyslots on the IE hardware.
+This KSM also serves as the way IE hardware can expose its capabilities to
+upper layers. The generic mode of operation is: each device driver that wants
+to support IE will construct a KSM and set it up in its struct request_queue.
+Upper layers that want to use IE on this device can then use this KSM in
+the device's struct request_queue to translate an encryption context into
+a keyslot. The presence of the KSM in the request queue shall be used to mean
+that the device supports IE.
+
+The KSM uses refcounts to track which keyslots are idle (either they have no
+encryption context programmed, or there are no in-flight struct bios
+referencing that keyslot). When a new encryption context needs a keyslot, it
+tries to find a keyslot that has already been programmed with the same
+encryption context, and if there is no such keyslot, it evicts the least
+recently used idle keyslot and programs the new encryption context into that
+one. If no idle keyslots are available, then the caller will sleep until there
+is at least one.
+
+
+blk-mq changes, other block layer changes and blk-crypto-fallback
+=================================================================
+
+We add a pointer to a ``bi_crypt_context`` and ``keyslot`` to
+:c:type:`struct request`. These will be referred to as the ``crypto fields``
+for the request. This ``keyslot`` is the keyslot into which the
+``bi_crypt_context`` has been programmed in the KSM of the ``request_queue``
+that this request is being sent to.
+
+We introduce ``block/blk-crypto-fallback.c``, which allows upper layers to remain
+blissfully unaware of whether or not real inline encryption hardware is present
+underneath. When a bio is submitted with a target ``request_queue`` that doesn't
+support the encryption context specified with the bio, the block layer will
+en/decrypt the bio with the blk-crypto-fallback.
+
+If the bio is a ``WRITE`` bio, a bounce bio is allocated, and the data in the bio
+is encrypted stored in the bounce bio - blk-mq will then proceed to process the
+bounce bio as if it were not encrypted at all (except when blk-integrity is
+concerned). ``blk-crypto-fallback`` sets the bounce bio's ``bi_end_io`` to an
+internal function that cleans up the bounce bio and ends the original bio.
+
+If the bio is a ``READ`` bio, the bio's ``bi_end_io`` (and also ``bi_private``)
+is saved and overwritten by ``blk-crypto-fallback`` to
+``bio_crypto_fallback_decrypt_bio``.  The bio's ``bi_crypt_context`` is also
+overwritten with ``NULL``, so that to the rest of the stack, the bio looks
+as if it was a regular bio that never had an encryption context specified.
+``bio_crypto_fallback_decrypt_bio`` will decrypt the bio, restore the original
+``bi_end_io`` (and also ``bi_private``) and end the bio again.
+
+Regardless of whether real inline encryption hardware is used or the
+blk-crypto-fallback is used, the ciphertext written to disk (and hence the
+on-disk format of data) will be the same (assuming the hardware's implementation
+of the algorithm being used adheres to spec and functions correctly).
+
+If a ``request queue``'s inline encryption hardware claimed to support the
+encryption context specified with a bio, then it will not be handled by the
+``blk-crypto-fallback``. We will eventually reach a point in blk-mq when a
+:c:type:`struct request` needs to be allocated for that bio. At that point,
+blk-mq tries to program the encryption context into the ``request_queue``'s
+keyslot_manager, and obtain a keyslot, which it stores in its newly added
+``keyslot`` field. This keyslot is released when the request is completed.
+
+When a bio is added to a request, the request takes over ownership of the
+``bi_crypt_context`` of the bio - in particular, the request keeps the
+``bi_crypt_context`` of the first bio in its bio-list, and frees the rest
+(blk-mq needs to be careful to maintain this invariant during bio and request
+merges).
+
+To make it possible for inline encryption to work with request queue based
+layered devices, when a request is cloned, its ``crypto fields`` are cloned as
+well. When the cloned request is submitted, blk-mq programs the
+``bi_crypt_context`` of the request into the clone's request_queue's keyslot
+manager, and stores the returned keyslot in the clone's ``keyslot``.
+
+
+API presented to users of the block layer
+=========================================
+
+``struct blk_crypto_key`` represents a crypto key (the raw key, size of the
+key, the crypto algorithm to use, the data unit size to use, and the number of
+bytes required to represent data unit numbers that will be specified with the
+``bi_crypt_context``).
+
+``blk_crypto_init_key`` allows upper layers to initialize such a
+``blk_crypto_key``.
+
+``bio_crypt_set_ctx`` should be called on any bio that a user of
+the block layer wants en/decrypted via inline encryption (or the
+blk-crypto-fallback, if hardware support isn't available for the desired
+crypto configuration). This function takes the ``blk_crypto_key`` and the
+data unit number (DUN) to use when en/decrypting the bio.
+
+``blk_crypto_config_supported`` allows upper layers to query whether or not the
+an encryption context passed to request queue can be handled by blk-crypto
+(either by real inline encryption hardware, or by the blk-crypto-fallback).
+This is useful e.g. when blk-crypto-fallback is disabled, and the upper layer
+wants to use an algorithm that may not supported by hardware - this function
+lets the upper layer know ahead of time that the algorithm isn't supported,
+and the upper layer can fallback to something else if appropriate.
+
+``blk_crypto_start_using_key`` - Upper layers must call this function on
+``blk_crypto_key`` and a ``request_queue`` before using the key with any bio
+headed for that ``request_queue``. This function ensures that either the
+hardware supports the key's crypto settings, or the crypto API fallback has
+transforms for the needed mode allocated and ready to go. Note that this
+function may allocate an ``skcipher``, and must not be called from the data
+path, since allocating ``skciphers`` from the data path can deadlock.
+
+``blk_crypto_evict_key`` should be called by upper layers when they want
+to ensure that a key is removed from memory and from any keyslots in inline
+encryption hardware that the key might have been programmed into (or the
+blk-crypto-fallback).
+
+API presented to device drivers
+===============================
+
+A :c:type:``struct keyslot_manager`` should be set up by device drivers in the
+``request_queue`` of the device. The device driver needs to call
+``blk_ksm_init`` on the ``keyslot_manager``, which specfying the number of
+keyslots supported by the hardware.
+
+The device driver also needs to tell the KSM how to actually manipulate the
+IE hardware in the device to do things like programming the crypto key into
+the IE hardware into a particular keyslot. All this is achieved through the
+:c:type:`struct keyslot_mgmt_ll_ops` field in the KSM that the device driver
+must fill up after initing the ``keyslot_manager``.
+
+The KSM also handles runtime power management for the device when applicable
+(e.g. when it wants to program a crypto key into the IE hardware, the device
+must be runtime powered on) - so the device driver must also set the ``dev``
+field in the ksm to point to the `struct device` for the KSM to use for runtime
+power management.
+
+``blk_ksm_reprogram_all_keys`` can be called by device drivers if the device
+needs each and every of its keyslots to be reprogrammed with the key it
+"should have" at the point in time when the function is called. This is useful
+e.g. if a device loses all its keys on runtime power down/up.
+
+``blk_ksm_destroy`` should be called to free up all resources used by a keyslot
+manager upon ``blk_ksm_init``, once the ``keyslot_manager`` is no longer
+needed.
+
+
+Layered Devices
+===============
+
+Request queue based layered devices like dm-rq that wish to support IE need to
+create their own keyslot manager for their request queue, and expose whatever
+functionality they choose. When a layered device wants to pass a clone of that
+request to another ``request_queue``, blk-crypto will initialize and prepare the
+clone as necessary - see ``blk_crypto_insert_cloned_request`` in
+``blk-crypto.c``.
+
+
+Future Optimizations for layered devices
+========================================
+
+Creating a keyslot manager for a layered device uses up memory for each
+keyslot, and in general, a layered device merely passes the request on to a
+"child" device, so the keyslots in the layered device itself are completely
+unused, and don't need any refcounting or keyslot programming. We can instead
+define a new type of KSM; the "passthrough KSM", that layered devices can use
+to advertise an unlimited number of keyslots, and support for any encryption
+algorithms they choose, while not actually using any memory for each keyslot.
+Another use case for the "passthrough KSM" is for IE devices that do not have a
+limited number of keyslots.
+
+
+Interaction between inline encryption and blk integrity
+=======================================================
+
+At the time of this patch, there is no real hardware that supports both these
+features. However, these features do interact with each other, and it's not
+completely trivial to make them both work together properly. In particular,
+when a WRITE bio wants to use inline encryption on a device that supports both
+features, the bio will have an encryption context specified, after which
+its integrity information is calculated (using the plaintext data, since
+the encryption will happen while data is being written), and the data and
+integrity info is sent to the device. Obviously, the integrity info must be
+verified before the data is encrypted. After the data is encrypted, the device
+must not store the integrity info that it received with the plaintext data
+since that might reveal information about the plaintext data. As such, it must
+re-generate the integrity info from the ciphertext data and store that on disk
+instead. Another issue with storing the integrity info of the plaintext data is
+that it changes the on disk format depending on whether hardware inline
+encryption support is present or the kernel crypto API fallback is used (since
+if the fallback is used, the device will receive the integrity info of the
+ciphertext, not that of the plaintext).
+
+Because there isn't any real hardware yet, it seems prudent to assume that
+hardware implementations might not implement both features together correctly,
+and disallow the combination for now. Whenever a device supports integrity, the
+kernel will pretend that the device does not support hardware inline encryption
+(by essentially setting the keyslot manager in the request_queue of the device
+to NULL). When the crypto API fallback is enabled, this means that all bios with
+and encryption context will use the fallback, and IO will complete as usual.
+When the fallback is disabled, a bio with an encryption context will be failed.
-- 
2.26.2.303.gf8c07b1a785-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
