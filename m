Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCgxFL20hWmbFQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Feb 2026 10:30:37 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAABFC0A6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Feb 2026 10:30:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vh6e4QBU3E8n9Q66zQYV3mA869DRiUWylm2MvjbTi44=; b=CcMD7jZTdrYpss5ANFMGznkGf1
	n/PH7VsWNmwp6mR5x6SRP8QRNSbfjykQvXEzcvaQcPh/ro65hlMY+xZ3kVim1MWIQIzy+IOAF5Xmj
	R1umr68dsAb0tED8/dqd1zhQZQt/T4CXx3pWuM1DeFvUBZ2S0Do/99Q9aLFoANftXOjA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1voIAR-0004QW-Bk;
	Fri, 06 Feb 2026 09:30:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dmantipov@yandex.ru>) id 1voIAF-0004QG-S2
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Feb 2026 09:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rrXA91n1UXqMeMb2vA0695kcokZ8n163WwrQYDTwDls=; b=WlUFixYLah/r/wq8AwPDJuxKvl
 S71btTb4x+TOyWsy2Np80gX8hxia/PnOJqk2LQSjpuC+CDLzrndWc+vA6V7od7O0n6Y3bmZs48AL3
 6DlSqt4ErV1dypybjTm+yK9CZ56oH5DZoIkYsclNgZiB3NHD5mgEsQsGfdAAbz44dEvY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rrXA91n1UXqMeMb2vA0695kcokZ8n163WwrQYDTwDls=; b=k
 6b5CNLA65csBz/rlUcL8o0TUiGqocqws4AQy3U/iaBE9WhTeTzao9K/xmL73XLoCtaXaW3q2VThqv
 I4B9ZobFmwNEmJDZcDGc5RM+POkAbTzyDvU66MhiroqxCoV3vNamacWw6CeCoPISNXQhWDpilW4ZN
 Bc3T3wXIqHRdHYvQ=;
Received: from forward103a.mail.yandex.net ([178.154.239.86])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1voIAD-000159-Oo for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Feb 2026 09:30:10 +0000
Received: from mail-nwsmtp-smtp-production-main-60.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-60.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c0f:4c18:0:640:5600:0])
 by forward103a.mail.yandex.net (Yandex) with ESMTPS id 62D8280B82;
 Fri, 06 Feb 2026 12:30:02 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-60.vla.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id 0UKWtN1GPW20-gjaCft8m; 
 Fri, 06 Feb 2026 12:30:01 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1770370201; bh=rrXA91n1UXqMeMb2vA0695kcokZ8n163WwrQYDTwDls=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=ZeEuE2chGLSiqpyQNq2rpHKZgiDMu8bI/cApJPJaA7aZMySdECSKqpUWAsu3bIKiS
 JHR/O3SXjKBNhBF2CfQXsN4wPa6WFDOlubkoS85us0RGvKoM97Uu+7KpTnEDhL/ASQ
 L9728E9rTHETWzt7UozqHO3CTbULVZ5ISOB1imYs=
Authentication-Results: mail-nwsmtp-smtp-production-main-60.vla.yp-c.yandex.net;
 dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri,  6 Feb 2026 12:29:58 +0300
Message-ID: <20260206092958.578191-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Shouldn't it be in this way instead? Note the whole thing
 looks somewhat confusing - the comment says "always truncate page 0" but the
 code explicitly says "in case of error, truncate page 0". This seems fixes
 https://syzkaller.appspot.com/bug?extid=fc026e87558558f75c00. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [178.154.239.86 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [dmantipov(at)yandex.ru]
X-Headers-End: 1voIAD-000159-Oo
Subject: [f2fs-dev] [RFC PATCH] f2fs: on truncating first page in error path
 of f2fs_truncate()
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
Cc: Dmitry Antipov <dmantipov@yandex.ru>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[yandex.ru : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:dmantipov@yandex.ru,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dmantipov@yandex.ru,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[yandex.ru];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,yandex.ru:s=mail];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmantipov@yandex.ru,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[yandex.ru,lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,yandex.ru:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: DAAABFC0A6
X-Rspamd-Action: no action

Shouldn't it be in this way instead? Note the whole thing looks
somewhat confusing - the comment says "always truncate page 0"
but the code explicitly says "in case of error, truncate page 0".

This seems fixes https://syzkaller.appspot.com/bug?extid=fc026e87558558f75c00.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 fs/f2fs/file.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d7047ca6b98d..bfc9ff97e4a5 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -910,16 +910,15 @@ int f2fs_truncate(struct inode *inode)
 	/* we should check inline_data size */
 	if (!f2fs_may_inline_data(inode)) {
 		err = f2fs_convert_inline_inode(inode);
-		if (err) {
-			/*
-			 * Always truncate page #0 to avoid page cache
-			 * leak in evict() path.
-			 */
-			truncate_inode_pages_range(inode->i_mapping,
-					F2FS_BLK_TO_BYTES(0),
-					F2FS_BLK_END_BYTES(0));
+		/*
+		 * Always truncate page #0 to avoid page cache
+		 * leak in evict() path.
+		 */
+		truncate_inode_pages_range(inode->i_mapping,
+					   F2FS_BLK_TO_BYTES(0),
+					   F2FS_BLK_END_BYTES(0));
+		if (err)
 			return err;
-		}
 	}
 
 	err = f2fs_truncate_blocks(inode, i_size_read(inode), true);
-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
