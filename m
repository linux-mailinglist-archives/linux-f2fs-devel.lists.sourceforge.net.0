Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GOfJt6FFWpXWQcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 13:37:02 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C465D4FA4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 13:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y8cryIigeWy2UnKY3BGRxwEcg4M3kbcdJyWP4zEel6I=; b=PMXVhMrLHKj6ShLV3o/cJL90HB
	00g41D/fCxuhElz+YP8ILD9OWlohCkX28rP6FbqCXOD6FwxZsCXFEfKAf5yZkj8y/HOVS5yiKsUl5
	2zk4ssh4QinortYnpLgoGi2cJMLGA+yFLypTB7pLWOAFXN7qeD2y/tCkmJfaxSv4kJlU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wRq5W-00062z-LB;
	Tue, 26 May 2026 11:36:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wRq5L-00062l-Nm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 11:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WAYdTgU2Q2WoKOLRPhvRxyrb9oYui7kZ0ExHIp0XfQU=; b=k4uzAebT7XmGCLdUqvALkA+0g1
 b4mAau+Xv+rnzm5URtJrKLdusz0prnCUyTMYqBvWYUkDu2znGxzh83rpnNGL/CxUS0+Ti+ABPag+G
 niklyoOriolh7+j5N4elo2bwfZg4CBc7dvXxIvjsVCT/9bsjcJp643Z+bCWLvF5WN79o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WAYdTgU2Q2WoKOLRPhvRxyrb9oYui7kZ0ExHIp0XfQU=; b=I
 Xa4uXYLr7ox49HdLHW4fajQk++qrhNpAc9rvUxsm6xmG6j1zrITvqYqGEnDMj7ITIfIjG3IqkPpEL
 m8X1W/E6fpg6IcIF3Ah7HWv3AGHiBFfWPEaaSGD47RLABJUB+vgkwzIAc6azzt6Ja4weljNMpQPf+
 5gxtiXUWjku4EmZ8=;
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wRq5L-0003tS-8b for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 11:36:36 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-36af4b7840aso1056056a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 May 2026 04:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779795385; x=1780400185; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WAYdTgU2Q2WoKOLRPhvRxyrb9oYui7kZ0ExHIp0XfQU=;
 b=QMTQVF7n413CXoNZdeym99/yZ6RDQ+ex2YKCB/XspTc0WKBzcoUNaqyXVhu5h0GTkb
 yrignGDeHuMJJIwD9IHWVSR5jrrd5Tb35RzV4uOR70HI6uFKbtzDVRfNAe2spoD3vHr+
 Ho0JfigYYFsBGwwgb9M4L+VwaQGjf0IjMshwrfri/+S/Cczc093UnDEL2JMSsZ5LxYff
 97rO+lz4ZrXB9zpMST9iOhyEPNTfnJ0ZrLU5MMiWLrOEZrJp4AGjV8+PNzGY8wBhzl2i
 XY+fqRNMMu6nCXSjiJdXZz9EBVTjr6outboE1JND7E4b14ltCtVPfwNV/W4CY+uKH5ve
 +V8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779795385; x=1780400185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WAYdTgU2Q2WoKOLRPhvRxyrb9oYui7kZ0ExHIp0XfQU=;
 b=aMhDVQG+5CPrAEHA8Lp9jsU2onr4GRDVPEjXNAUvYWLLelhB9T2W1CQewDaxioHjcC
 GwmMYon+waT1OACZNx6Vy5ZWiUG+hVl/1DoiI1f4JXlbdgtuaNi6p3d199vNN4vFO9qi
 Ymsox9kGUm9S36JGMOvVDHpP1I5u/y9KFeXnaUo63YLvDFq0HpRKXjTMzgD2EXpTh7oK
 aAyqVKVpPhV0dUiJpgxp3cL+tt5Vy6t0MXwoaLib7pQ0ezk3mifeC48ut6krdTgz9y/E
 x5P2BbSyVkuJHwUpgTvv+Ext/8yTBTahEes3peQzZHDyxZeUUnozS3Aa54EGx95NXyYX
 8K5Q==
X-Gm-Message-State: AOJu0Yx9p5LX3vRdieNU4mJbBPBGJrR+ZmTJNHxjW7doWLLqLaRV4Esz
 z/tmaWHXIg/vtJVfqQPnCaGjW3UuYhZs3vAYXEaEdC67sRceZp74bOeLKg+fwA==
X-Gm-Gg: Acq92OFNRC5CAJSir0ohGBJn1FkwGJXLri/1NsmEtxsdxws3o+BXWHaN9M9JvQanslh
 HO6YIbeDAjB4Y3FOUXOZ6zrY6SDEJQJ+EQnA82kbp1fd78MdLNvxf/v6+cmD+4uhaxQZTrDmLxW
 oE8U6nzZzlVL9Em6Xg0fH4YulMKl02vzTbpe9YD8G3hWeoFrvzweYVz3TLQMEiOxFajAk4Cuje9
 It1Y/1F5CYMlg63+572xNfzrmdgUEs4h1IcF4AufyfgyRttkHF+GMPZ6cn8oXKl2GXay89txe7E
 FEsU5fceZZK6vWNiLA2NflJkhcl23HBGaR4OboK4cSiGvOcxDA3Yf+XzMAKeActanLRi5zboAAx
 /M+SelHrN7jOri3kakM25wZt+ljeKrjLof9MYJtZW6U8Kuf/j1sbecOV48+rY99vulWM+WmhhgY
 lDhD5l0LXryzBLxdASD8Tmhfv3TLPEm/H3gLuDHFpi66bYfXlHzps+egiVDN/2Fkma42x9IQ==
X-Received: by 2002:a17:90b:2d44:b0:369:a74b:28cc with SMTP id
 98e67ed59e1d1-36a674f3475mr16808060a91.18.1779795384965; 
 Tue, 26 May 2026 04:36:24 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a72c913a1sm11656272a91.15.2026.05.26.04.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 04:36:24 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 26 May 2026 19:35:05 +0800
Message-ID: <20260526113505.1312431-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The kernel can record ERROR_INCONSISTENT_ORPHAN in the
 superblock
 s_errors[] field when orphan inode metadata is inconsistent. Add the matching
 f2fs_error entry and fsck error string so fsck.f2fs can recognize and print
 this persistent corruption hint. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.53 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wRq5L-0003tS-8b
Subject: [f2fs-dev] [PATCH f2fs-tools] fsck.f2fs: recognize inconsistent
 orphan error
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
Cc: qwjhust@gmail.com, qiwenjie@xiaomi.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:qiwenjie@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: E9C465D4FA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The kernel can record ERROR_INCONSISTENT_ORPHAN in the superblock
s_errors[] field when orphan inode metadata is inconsistent.

Add the matching f2fs_error entry and fsck error string so fsck.f2fs
can recognize and print this persistent corruption hint.

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fsck/mount.c      | 1 +
 include/f2fs_fs.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index 2f4e6c9..f7985dc 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -774,6 +774,7 @@ static char *errors_str[] = {
 	[ERROR_CORRUPTED_XATTR]			= "corrupted_xattr",
 	[ERROR_INVALID_NODE_REFERENCE]		= "invalid_node_reference",
 	[ERROR_INCONSISTENT_NAT]		= "inconsistent_nat",
+	[ERROR_INCONSISTENT_ORPHAN]		= "inconsistent_orphan",
 };
 
 void print_sb_errors(struct f2fs_super_block *sb)
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 21310fa..1b24a3c 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -772,6 +772,7 @@ enum f2fs_error {
 	ERROR_CORRUPTED_XATTR,
 	ERROR_INVALID_NODE_REFERENCE,
 	ERROR_INCONSISTENT_NAT,
+	ERROR_INCONSISTENT_ORPHAN,
 	ERROR_MAX,
 };
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
