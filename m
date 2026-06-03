Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qPykE01SIGoE1AAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 03 Jun 2026 18:11:57 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9202C639949
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 03 Jun 2026 18:11:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=ZV+WKt8T;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=WigV0tuj;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="I qhk8vu";
	dkim=fail ("body hash did not verify") header.d=trailofbits.com header.s=google header.b=AaSU44bj;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gEYrIEmwW4xsQuAjNE7ic0ceT0b8Dz9+vNPNeOMmbJk=; b=ZV+WKt8Td/7kwvzOREA6IEEK8a
	6ZmLFUdxYjj8lsBpZ85lbJGNnfpwCCc7Lrdh/AJGbG+vbNw0M4i97ATxvMKbBvID5kk5dXoX1uZd5
	w4q+8nZbKoTma56URA5G/4qQOFDXIVq40UgPzCFvRqcWpVql7CjJsybyWQHuuU7vf54k=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wUoC5-0003rw-73;
	Wed, 03 Jun 2026 16:11:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sam.moelius@trailofbits.com>) id 1wUoC3-0003ro-Mm
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Jun 2026 16:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xNqB2JQWYAKjwg81Phk/lsiaycyc8892EHyx2k8tINw=; b=WigV0tuj7jnOaKB4Fs9IQOEkyZ
 g0VStvknJNFFCoWk0AvpFV/tj6AvqbF4wNmjWcNdSTIeOGf6uN8stuvcZp+gNL3qDsvD1LNJJwICM
 xfn+OptjToG5ocxkhYVjJLY1pcdJkeNu2UCA8/bpR9q6340D/UijY+7bSLWKyS+7FaAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xNqB2JQWYAKjwg81Phk/lsiaycyc8892EHyx2k8tINw=; b=I
 qhk8vuHaK0TTXFrL8enHfrfGoV1AvDDPT3L5sYM5TnwqOREKn1/L1j7/qzmmFUG8XmLp61fYtuuMH
 YBpFeaNFu1XSp9ojJwkeeAi+XHuolxDQrsyi22QNDrLEPPtv6bSiNlgeztt1KHwR9Jy8c/EDDVVKe
 H8rICy2uy3r2n2rQ=;
Received: from mail-qv1-f41.google.com ([209.85.219.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wUoBw-0002K1-Qr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Jun 2026 16:11:45 +0000
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-8ccf0fa0aacso72095526d6.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 03 Jun 2026 09:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=trailofbits.com; s=google; t=1780503090; x=1781107890;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xNqB2JQWYAKjwg81Phk/lsiaycyc8892EHyx2k8tINw=;
 b=AaSU44bjbLCvdTWd0ugNeEOUhTlIUmvW1O5ZVFjtn7mDCThvg/HHfLe61AjIZSeE24
 nIg0tS+UyYZJL7bNMDelSCUCyF+jmZLWgtX5tt7U00M8xaqiBsvEbTUuW7/249vJARPm
 tnLY2Vm1fu/UGV9iGoXNxjOzgo+WmO3cyXeqYsOCTVbI2Ys5opvh0uVISiX7ulflnKtG
 MY6NvpjGEX1MhW9R8eVLph8NhLsbjLhgsJyk4GFY7/nIpS6etA7DhGoyiYx/LmrAsnBj
 sNJx9w30ddZk7LNg3R1Eyku83LADbRGXFLL5tCPCWm3sWvD83bPVuE6XJe4xq4GSIJNT
 V2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780503090; x=1781107890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xNqB2JQWYAKjwg81Phk/lsiaycyc8892EHyx2k8tINw=;
 b=asuclP67u9k3HqiVC32HTPpx9kpD0oSlibZdauH3lhi/7m1XyromUrePj1S1hSieQZ
 Juy+7fXcOFCjBw8Trt1oshU3aYpZnNiBpI2HkoUZ7W57683N6sdN/yrbhHfwdU5fmHFN
 amLKlWBiPKUMTx9f3MBrToFrQ38WOdNPpdeYTfw6jgh8SoSZddg6ra4LeMAogKul8Mxy
 6yA/Z7lFxd3FmRMj7rG7OtocXbMx60a2dKD/wZB9gHpX5sAscozb9HrJ3oX4LP2SMgT9
 OLUb+OJOZEYvHqR8v/eSvnbN4nojs29HQ/XRj+Lkr1j69+v/9WDY0Cgn5+p3xmlkUZXr
 vL4w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9b6vo0x/riiD8VFxnafmyyfDeciotCP/8tsszEo1jftWgT8yJqFSOwQLvJxMow/7qY91becEvgT3Tq/BTOketP@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxpCthGvxSmDGL0NNgtiOnf1s5yDF/p7NluYGVHrh8ezULLB/fL
 m12NNnkGBGpFIn62AKYYL00g4YZUiAq5S6YvY4EmJAMEkZ9t0isR+D2LreGJMuaPqPIzW5bNuY2
 xvJ5KRVE=
X-Gm-Gg: Acq92OHTkwr3lL+NaWGhED+iflz0MRClv8Y6T505oNjknoTpNCZXWDCTirs8hmQW2KJ
 JQl126wjGIIBPxWeeDrz2TJCzJH73B8MVvFx9L63TqlJlRwLfYLxsL4h4C3a14k8brB0h8fReU+
 KS0TzDZkIcHu1dDeBHah9V/dD/LNvIXli4AR8fAcuzgb5teoEE92rXjp8iKOJAkLKrAYGgUZjRB
 5aHbNZlSZP4Scomn0EgcAXTnryuJLkMtcHRPSiltlm4XB2iYrLexXhw6k7DmmqFGKNRrtwwsOKl
 LFmA1KfUH6SONpD4bjWZVKQP+v1ugJM0mcob4o703bNVSWw+D9mHRchja3hZTPb8kSiAKKSxBva
 TrGkP5pBccDbB8TG0zc1voMmXZwEakKkRQxhmbAAbyLn4XdlqwhF4998DLbb4h+VXD6/JRbBS2F
 cVoNvZo1DKyyYQmwqT8OSRVB+htxgjuXYUkSUPzg==
X-Received: by 2002:ad4:5c68:0:b0:8ce:9ecf:e92c with SMTP id
 6a1803df08f44-8cecded8622mr58787436d6.15.1780503090189; 
 Wed, 03 Jun 2026 09:11:30 -0700 (PDT)
Received: from localhost ([161.35.96.86]) by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-8ceccdcc968sm25080086d6.22.2026.06.03.09.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 09:11:29 -0700 (PDT)
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed,  3 Jun 2026 16:11:26 +0000
Message-ID: <20260603161127.17464-1-sam.moelius@trailofbits.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The f2fs dentry lookup path can use the on-disk name length
 before checking that the name fits in the dentry filename area. A corrupted
 dentry can then make lookup read beyond the filename slots. The bounds check
 needs to happen before any comparison that consumes the name length from
 disk. Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.41 listed in wl.mailspike.net]
X-Headers-End: 1wUoBw-0002K1-Qr
Subject: [f2fs-dev] [PATCH] f2fs: validate dentry name length before lookup
 compares it
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
From: Samuel Moelius via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Samuel Moelius <sam.moelius@trailofbits.com>
Cc: open list <linux-kernel@vger.kernel.org>,
 Samuel Moelius <sam.moelius@trailofbits.com>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:sam.moelius@trailofbits.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,trailofbits.com:s=google];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,trailofbits.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[sam.moelius@trailofbits.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9202C639949

The f2fs dentry lookup path can use the on-disk name length before
checking that the name fits in the dentry filename area.  A corrupted
dentry can then make lookup read beyond the filename slots.

The bounds check needs to happen before any comparison that consumes
the name length from disk.

Reject dentries with invalid name lengths before comparing their names.

Assisted-by: Codex:gpt-5.5-cyber-preview
Signed-off-by: Samuel Moelius <sam.moelius@trailofbits.com>
---
 fs/f2fs/dir.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 38802ee2e40d..14161d5a1af0 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -249,6 +249,11 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
 			continue;
 		}
 
+		if (unlikely(le16_to_cpu(de->name_len) > F2FS_NAME_LEN ||
+			     bit_pos + GET_DENTRY_SLOTS(le16_to_cpu(de->name_len)) >
+			     d->max))
+			return ERR_PTR(-EFSCORRUPTED);
+
 		if (!use_hash || de->hash_code == fname->hash) {
 			res = f2fs_match_name(d->inode, fname,
 					      d->filename[bit_pos],
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
