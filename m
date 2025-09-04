Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA37B436EE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Sep 2025 11:20:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t0s7JRdco72kw8btR+gx86d0Jt88ILhdTWMrwSUoA6Y=; b=lfDkXdx34RRW/oIkzLn2qT/5Ft
	VzU7mY/W6IN74vB0ba9/85fhUBicq6I8iKM/isAiKRA5YNJ4bwKkxD3HxdnfCgA/hNpbOZdEI28sC
	GgieOkaZGV8ICuoMT1cKBxWKsZG/xJnb1DVOE8PbiMIuGr5rPftGDKczGAArbWn3RzSs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uu693-0003B1-Vg;
	Thu, 04 Sep 2025 09:20:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3-VO5aAwKANI7DFIGy8CKG864CC492.0CA@flex--jprusakowski.bounces.google.com>)
 id 1uu692-0003Ao-Ux for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Sep 2025 09:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EqK/tWKIg00wKoXSmamrcavWYc1ptK+oT8MqdmYppT4=; b=HFt+j8uQTpvVv+XZYJ5Tz1Ugtw
 wIHYHmWuGWIjgVBWU2ZEg+2WcMyV1yct/ajrIHwG5UwWBGvYaks+zM2vYHRfIkltZzj88ha3rRxIe
 fyRkGaeUesfBi+b2WLl2iKOtcMthj7xLhIQBIh2uB3ksVQXp+UvPt6VJwwgrRKpgxKbc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EqK/tWKIg00wKoXSmamrcavWYc1ptK+oT8MqdmYppT4=; b=P
 5nlgAt7hEYtHvAtjqphuUmeGT4vA0cWjK69C4l5F5XYAjzefWNplwFwMRV02aMPOhKQAzaIHtFRsM
 YSxy+bBRsdl/OiqQdwV/pS0W4CqfOaqckkpVHtP8nLLe0gHNfqf8vEhEkuhLqGM2RXUy2z3i4mOuE
 KjIx5kIPAXhNLuhA=;
Received: from mail-ed1-f73.google.com ([209.85.208.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uu693-0002Bz-96 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Sep 2025 09:20:41 +0000
Received: by mail-ed1-f73.google.com with SMTP id
 4fb4d7f45d1cf-61cbc94f5b6so1038334a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 04 Sep 2025 02:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756977635; x=1757582435;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EqK/tWKIg00wKoXSmamrcavWYc1ptK+oT8MqdmYppT4=;
 b=XX1dL1CkW2zBrVu9znnqxMWIM2N9KQlO2Aun0Q0HeueUS0lIDxYQUtx1xLMsYBrOxT
 RRmSglxZkCV4UcLqY9kSQrETFWthSVewkmvodEtsfYTCjyJ7Cdt1sno1+fmfJ3jEhGkO
 cNbo/nYnjjOdSxG6dxQ8PAv+p8iTiuTNkiL2G3T8lg4isbc0C+XiwwMATupEqm5hu6jJ
 W7Y4EFNzJBEgSTIwOkiSsBlitHRdpsXbx6958jDFALNuPJl/niRwuzCOGg6AQxR7vE0n
 SzG5hLN+CJqD/cnbAWxs1643JdYwFHawFepduG/Z/w1e/WyGjay1dlUub4gJeblPQg3c
 tOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756977635; x=1757582435;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EqK/tWKIg00wKoXSmamrcavWYc1ptK+oT8MqdmYppT4=;
 b=sqZrSZhz+y4zrrTSyMEfWDfobQp6Er9Lr1K/3eGrpPE1EL4NmhJxjEUjbMeWoaH2Pm
 /t6zfCA1v2FpcBH598IfYg96YH/HmKdUmVIbNehFZ7URn5/I+/ROUjp/CMk6riAszFJ+
 f17ztC7CL8Vc97U9XTW20H94VexmHhg4B9hoNv11CC+A+TTdHzbFzh3w/kjsQOiNNfO3
 5JqwfRpbgMa4NhrnD93/TpIEy9QE4+C051P29eaHi1PIQhKq81jF0NLHZDUpUE7S9Rxd
 VEr5wxvAQGA4lmUZHw8FecMK7aJD4vjJ2xiAzwBqK2rw4zuiHKmKR4KLsQZa7Ku+hYDx
 /J9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt5t99iGteal1DyIzzFTf7E1yYzBI1ngDw7JZw0UPrUGtISwjf8jM95rjdHM8MijFm78GSZoKJ2OfAJy1FN6Ot@lists.sourceforge.net
X-Gm-Message-State: AOJu0YykRVeCgAYPuGXk0ZZ+a5RxiGJo4apdG2R6wtyo/ozfksOslkp2
 pYN8XpJnGjyi81F356S3v5GcH4IeBYJHBQVll1Xf1IPYX07q7Egw0R9I/IVLxOpgxjM6E6/gerO
 LskDaJl8XR3uzbpsXDJVcx4Bqg/m5Xw==
X-Google-Smtp-Source: AGHT+IE60EE9lJeTaBTVJKZmUHCQgwymZdNMgHzePlfSDAH4ZihwXcAKTO5Du6kLMx41CtNfcr8n2wobhtZcP94KI4k=
X-Received: from edc24.prod.google.com ([2002:a05:6402:4618:b0:61e:da91:9881])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:510d:b0:618:1d7d:b967 with SMTP id
 4fb4d7f45d1cf-61d269a7f11mr16318549a12.12.1756976121207; 
 Thu, 04 Sep 2025 01:55:21 -0700 (PDT)
Date: Thu,  4 Sep 2025 10:54:49 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250904085449.290354-1-jprusakowski@google.com>
To: Zorro Lang <zlang@kernel.org>, Chao Yu <chao@kernel.org>,
 fstests@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: _verify_ciphertext_for_encryption_policy() checks if
 encryption
 works correctly by reading encrypted file's contents directly from a block
 device and comparing it to a known good ciphertext. This, however, won't
 work if the file systems is also compressed. So this patch disables tests
 using this function when a compressed FS is used. 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.73 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uu693-0002Bz-96
Subject: [f2fs-dev] [PATCH v1] common/encrypt: Do not run
 _verify_ciphertext_for_encryption_policy on compressed FS
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
From: Jan Prusakowski via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jan Prusakowski <jprusakowski@google.com>
Cc: jaegeuk@kernel.org, Eric Biggers <ebiggers@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

_verify_ciphertext_for_encryption_policy() checks if encryption works
correctly by reading encrypted file's contents directly from a block device and
comparing it to a known good ciphertext.

This, however, won't work if the file systems is also compressed. So this patch
disables tests using this function when a compressed FS is used.

Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 common/config  | 1 +
 common/encrypt | 4 ++++
 common/f2fs    | 7 +++++++
 common/rc      | 3 +++
 4 files changed, 15 insertions(+)

diff --git a/common/config b/common/config
index 22b52432..1420e35d 100644
--- a/common/config
+++ b/common/config
@@ -509,6 +509,7 @@ _source_specific_fs()
 		;;
 	f2fs)
 		[ "$MKFS_F2FS_PROG" = "" ] && _fatal "mkfs.f2fs not found"
+		. ./common/f2fs
 		;;
 	nfs)
 		. ./common/nfs
diff --git a/common/encrypt b/common/encrypt
index d4f6e3dc..43ec349b 100644
--- a/common/encrypt
+++ b/common/encrypt
@@ -989,6 +989,10 @@ _verify_ciphertext_for_encryption_policy()
 	fi
 	set_encpolicy_args=${set_encpolicy_args# }
 
+
+	# _verify_ciphertext_for_encryption_policy will fail if the FS is compressed.
+	_require_no_compress
+
 	_require_scratch_encryption $set_encpolicy_args -f $policy_flags
 	if $hw_wrapped_key; then
 		_require_hw_wrapped_key_support $SCRATCH_DEV
diff --git a/common/f2fs b/common/f2fs
index 1b39d8ce..c46e2aa2 100644
--- a/common/f2fs
+++ b/common/f2fs
@@ -25,3 +25,10 @@ _require_scratch_f2fs_compression()
 		_scratch_unmount
 	fi
 }
+
+_require_f2fs_no_compress()
+{
+	if _normalize_mount_options "$MOUNT_OPTIONS" | grep -q "compress"; then
+		_notrun "This test requires no compression enabled"
+	fi
+}
\ No newline at end of file
diff --git a/common/rc b/common/rc
index 81587dad..882e0588 100644
--- a/common/rc
+++ b/common/rc
@@ -2112,6 +2112,9 @@ _require_no_compress()
 	btrfs)
 		_require_btrfs_no_compress
 		;;
+	f2fs)
+		_require_f2fs_no_compress
+		;;
 	*)
 		;;
 	esac
-- 
2.51.0.355.g5224444f11-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
