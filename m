Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50643C52953
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Nov 2025 15:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsmzo8u3B1St5143FjVa5BEx82apOYSf6qfrYwEF+wc=; b=egu9J1cGI2o26V1XeABYgrMjKA
	wyt50KGy9bA2wpf4mbnalPgF1mYMd+i7i0wuNMYy81N1P1qh3eGZpaAP3Z5rhIog26TcQ/Tj86wM+
	rDYGb6L0I31N2l+O6L7VfYkHDpeP1TmgHB45FQkPH3stjp9p0GEDzBKaU0094/8sD7tI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vJBOH-00055f-4W;
	Wed, 12 Nov 2025 14:00:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3IpEUaQsKAOUQVHUULJOPLUNVVNSL.JVT@flex--joannechien.bounces.google.com>)
 id 1vJBOE-00055V-NJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 14:00:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OENtFm3i817Weeec6gfeOIxaItbxpGoqMQTgjpOdTX8=; b=m6JQAWKfQ5oc1qdyt4cQTEHjbN
 BG0+1n8eGVmIEv5D2WUFgi8/suv0NO6ivg4cW/pyc+Uyuq/I3aLyr4xXbfbjk67vo3hfApg6mQrlG
 HHZYBdHPGYEYHbfIWcmmFU1yDxod89ufTNqo3HBErhTowMSCiNZ6cM2n85sYigBgLYEQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OENtFm3i817Weeec6gfeOIxaItbxpGoqMQTgjpOdTX8=; b=H0kJEHKhy56HoCdAe2nJMgSlZa
 6lTlqoru+qCxbbxYSUXafCl9ywnJ5akIIme6H8VGuh4aY4FRIWpkgGFhyNs/d4lk5i9mYqXHxhgKa
 tUVjOXZxf9mMLG6SQ6Ks8sblT23al7XuAlzff+5bX4zDiqWq4h0GceiYfbMbGfliTnls=;
Received: from mail-oi1-f201.google.com ([209.85.167.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vJBOE-0000GQ-Ac for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 14:00:02 +0000
Received: by mail-oi1-f201.google.com with SMTP id
 5614622812f47-4504616ece0so1501197b6e.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Nov 2025 06:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762955996; x=1763560796;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=OENtFm3i817Weeec6gfeOIxaItbxpGoqMQTgjpOdTX8=;
 b=ob57f7Saf7krvjLUrZx7YbPCs2WimMKz7X34gXJ+AYVS85auGnJHmLdo8fFUzrkMJx
 jJ8Do5PbDoScSW0Tvb/aU6sdG3AyWZRkmIZ2E4FEAIBpefxFARx/XkMvORZLg+XMQZp1
 uwShaf6O8JaUCwEaEoWLlRObNjFG6ihF48K7YmpQXKUxxJi23+pcWMWQk7GnQ9ZLhyPN
 7SP49exU7YwBad0u/ZMm4Bdf+E8KxL6LI0HIN1FeL1ku75DLweLMGepDRl86RgWLuqmA
 /y6F0v5DxN6xhbo+JH6axJMX9wREPyPo6kWSA65RmAejMEKVw8EKH6Xm3+sAhJtqtOqQ
 La3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762955996; x=1763560796;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OENtFm3i817Weeec6gfeOIxaItbxpGoqMQTgjpOdTX8=;
 b=vVv9yDyomc6nP903rkciBKs2mLb8VC0JiGfZx311YqmST8bcPJ19TUkTUUQQXsp4BO
 Mskgpeyt9W+/9j+PEwv7UoVteILpD34KsV9GJgq9qoRuDRN8eBGHWEq1TyEWbZ/FJeaY
 vfVgzexlPRvvIQwG/g5Z3fUTMv8who++wB+3WwALwRS2fQTO50ZrTUM+w0MrFSWGeQyf
 QoS0fiX+ydug6LgLTeHYnMaZjgxLbOEqDgp2psS86C7NJTQk6rraXCU6xKlKeVATc1EH
 2qCeQlE4d5DIUgqbcKdJc5vYnEav/ejzGdAepEQOmoXd4RrqGxQGCVhKlbzNZLOpnVfk
 ztGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmyO5DKNaBina2WTRyBuIS7QAYB4oGViJMiRSbejkJO0q3w6HtcWVSXSpk0ZPkVftgbYJ+/A4+Ion1BxVzy3Es@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzVjKABm9jcal3Et2kyxq6uASLIDQfiwKD0ccnA/X2meD3vOakG
 1ua2SUAHVmcvV5b4ALZsLosvDU3Mc6tjQkm+G+NyvN0rpR9am63/PdpMBWVsHb4q8n/50pdUi0/
 xHvmItRF7q2WUHBcBLkYfv8je7A==
X-Google-Smtp-Source: AGHT+IGYly76A9Dd808N0QerjHX/E1vUnUBAoo2QELTCdqvZDNN1bXjuebt9+R3/MPxan6OXBu1W5VVnu9LUrxpnQw==
X-Received: from plby21.prod.google.com ([2002:a17:902:ed55:b0:295:304d:8359])
 (user=joannechien job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1904:b0:297:c638:d7ca with SMTP id
 d9443c01a7336-2984ed356e1mr34439665ad.14.1762955554887; 
 Wed, 12 Nov 2025 05:52:34 -0800 (PST)
Date: Wed, 12 Nov 2025 13:52:22 +0000
In-Reply-To: <20251112135223.3467852-1-joannechien@google.com>
Mime-Version: 1.0
References: <20251112135223.3467852-1-joannechien@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112135223.3467852-2-joannechien@google.com>
To: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add test cases to verify f2fs's support for different
 versions
 of the "test_dummy_encryption" mount option. To ensure test robustness, the
 MKFS_OPTIONS and MOUNT_OPTIONS are cleared. This prevents additional options
 from interfereing with the test results. 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.201 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1vJBOE-0000GQ-Ac
Subject: [f2fs-dev] [PATCH v1 2/3] f2fs/016: add test cases for
 test_dummy_encryption mount option
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
From: Joanne Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Joanne Chang <joannechien@google.com>
Cc: Joanne Chang <joannechien@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add test cases to verify f2fs's support for different versions of the
"test_dummy_encryption" mount option.

To ensure test robustness, the MKFS_OPTIONS and MOUNT_OPTIONS are
cleared. This prevents additional options from interfereing with the
test results.

Signed-off-by: Joanne Chang <joannechien@google.com>
---
 tests/f2fs/016     | 6 ++++++
 tests/f2fs/016.out | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/tests/f2fs/016 b/tests/f2fs/016
index 800f75fc..a6df827d 100755
--- a/tests/f2fs/016
+++ b/tests/f2fs/016
@@ -35,8 +35,14 @@ options=(
 	"compress_mode=fs"		"extra_attr,compression"	\
 	"compress_mode=user"		"extra_attr,compression"	\
 	"compress_cache"		"extra_attr,compression"	\
+	"test_dummy_encryption"		"encrypt"					\
+	"test_dummy_encryption=v1"	"encrypt"					\
+	"test_dummy_encryption=v2"	"encrypt"					\
 )
 
+# remove all mkfs/mount options to avoid affecting results
+export MKFS_OPTIONS=""
+export MOUNT_OPTIONS=""
 for ((i=0;i<${#options[@]};i=i+2))
 do
 	echo "Option#$i: ${options[$i]} : ${options[$((i+1))]}"
diff --git a/tests/f2fs/016.out b/tests/f2fs/016.out
index a8c96972..5ff116a7 100644
--- a/tests/f2fs/016.out
+++ b/tests/f2fs/016.out
@@ -31,3 +31,9 @@ Option#28: compress_mode=user : extra_attr,compression
 0
 Option#30: compress_cache : extra_attr,compression
 0
+Option#32: test_dummy_encryption : encrypt
+0
+Option#34: test_dummy_encryption=v1 : encrypt
+0
+Option#36: test_dummy_encryption=v2 : encrypt
+0
-- 
2.51.2.1041.gc1ab5b90ca-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
