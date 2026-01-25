Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QC9oCsyPdmksSAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Jan 2026 22:49:00 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3502D828EF
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Jan 2026 22:48:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hW7ANe0frXn5XlX2ZCMjyj0oJ5HzK8MKgqIju9WJtw4=; b=mHfA26Gkwz/5SSg6MJs/8IcDLN
	Azc0upusmhAru0aE6wDZqLDyRdSCZ1bM3bhfVo5m0d+h7ItZkDJkEJfaNU2UXJSDgzRt0KYZfpjhE
	vB3GL+d60Okt04GF8fP1VPyF9uct3+NIhhCW0F5wpweQh9Tjk0aY6Q7FEqnc8thKRoEk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vk7yO-0003og-SB;
	Sun, 25 Jan 2026 21:48:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1vk7yM-0003oX-So
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jan 2026 21:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=quPIaL6J4vgskyL8jbt0HEBw7S9sSjdcy/gh2a5f1k4=; b=fXTYbjoxaZCjqS11KF+dD6FQSj
 +PBnULCBLdsEP+aZELUxqGwVFprPI1S9D/2qhVnIl8wjUc3Eh3+6ofOq8+zxPsDawbjPpf+ZDdefm
 8BtV4hVwpYhQ8CDnz6mAdzznAOLuE1sutCvbA/lkq65++aAh40uBX992i/Hp1l7UlCFE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=quPIaL6J4vgskyL8jbt0HEBw7S9sSjdcy/gh2a5f1k4=; b=QECS+FS6A+/60ub66m6c8+rwbM
 VRHZE1CLSU1hk+Gcn3+gLW1IXh17aJttz+hQNcZF/Q07k1Nq2j274KTKLb29VlyaSG81c4sv6kCYP
 ybUv3m8gOE+gBLIyzpt+waFiJBSyXEC9kH7ZfrqQHKpGggkVVYPeSX3UuTnR71rDObrk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vk7yL-0002Vf-Jv for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jan 2026 21:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=quPIaL6J4vgskyL8jbt0HEBw7S9sSjdcy/gh2a5f1k4=; b=e5UblH7z5/IjdAKi22YkrU/R70
 RpKHo3fZ71OVhhLv/oYJcW70xMU/N3QMFRSrTRoQ9NeI+QbCHXH6TZFSTz7yN+zkprWYk2wCe/zb3
 WX/cZTCUAglWH3fuxkJxwIsSo1ygzzq8aILKQhkTwvQIZa0Gs44VH3lUCouxwoEMoc1LE24FR4KWG
 fJMxm+deBt8KWp6yJWvwdt80mv2jzq+ZxWiF2/cKu3t4q9ZP9O5fMu/JhZ+INTwx0ZWaHrytz8VhQ
 dRyMWcchY40sPMrTdfnDW2tPwobxN98aqvOeIbVBJ6KjknVfCVzvDeD2O4zCb58CWO3yMSzyMePbg
 j2CpBSzw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vk7y2-00000004zbi-1ua8;
 Sun, 25 Jan 2026 21:48:22 +0000
Date: Sun, 25 Jan 2026 21:48:22 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <aXaPph6Yi-hzf0J-@casper.infradead.org>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-12-hch@lst.de> <20260125013104.GA2255@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260125013104.GA2255@sol>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jan 24, 2026 at 05:31:04PM -0800, Eric Biggers wrote:
 > Maybe do: > > if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode)) { >
 /* > * This pairs with the try_cmpxchg in set_mask_bits() > * us [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vk7yL-0002Vf-Jv
Subject: Re: [f2fs-dev] [PATCH 11/11] fsverity: use a hashtable to find the
 fsverity_info
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DMARC_DNSFAIL(0.00)[infradead.org : SPF/DKIM temp error,none];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:?];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	R_DKIM_TEMPFAIL(0.00)[infradead.org:s=casper.20170209];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 3502D828EF
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 05:31:04PM -0800, Eric Biggers wrote:
> Maybe do:
> 
> 	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode)) {
> 		/*
>                  * This pairs with the try_cmpxchg in set_mask_bits()
>                  * used to set the S_VERITY bit in i_flags.
> 		 */
> 		smp_mb();
> 		return true;
> 	}

Is there a reason not to do as DAX did:

+++ b/include/linux/fs.h
@@ -2119,7 +2119,11 @@ extern loff_t vfs_dedupe_file_range_one(struct file *src_file, loff_t src_pos,
 #endif
 #define S_ENCRYPTED    (1 << 14) /* Encrypted file (using fs/crypto/) */
 #define S_CASEFOLD     (1 << 15) /* Casefolded file */
+#ifdef CONFIG_FS_VERITY
 #define S_VERITY       (1 << 16) /* Verity file (using fs/verity/) */
+#else
+#define S_VERITY       0         /* Make all the verity checks disappear */
+#endif
 #define S_KERNEL_FILE  (1 << 17) /* File is in use by the kernel (eg. fs/cachefiles) */
 #define S_ANON_INODE   (1 << 19) /* Inode is an anonymous inode */


and then we can drop the CONFIG_FS_VERITY check here and in (at leaast)
three other places


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
