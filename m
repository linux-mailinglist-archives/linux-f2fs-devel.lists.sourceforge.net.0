Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D26AEEE6E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 08:14:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4koN/1WWUUYAdOKdL6bQmNrgPB41PyECybJWRowdoM=; b=HeQ1q9vq89VoT3X+G0ERFa2ZJw
	nVXxYGp0p6XWI1XG8UnHsBBlC6dFHfmSBUDabRmuIKR1SERjEktMN+nIemBqgHJEf/QZ4+AcYaMIJ
	s2tw4C5upIUY6u+n9LqOG76p/erfDT7jAUI2DZurg6H22GaN/Mmz+bafyX9SJhKqi3L8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWUGZ-0006IJ-7w;
	Tue, 01 Jul 2025 06:14:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+3b1883a23afd6568c89e+7982+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uWUGW-0006IC-86 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 06:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gc4XjL5EuHDBKQZc9KZENAeMq/+oahftr2cmxvLnjwM=; b=lYR8UN5MlVZ32MQRolFXFJuI1l
 dwUk7gKZgFRXPcGxKBhY/9d3nhfw0/zZeOUzuG/ojrKimIQatXnLU5V2eEBPXXui57GT8QSSXm3d0
 Vj/of2HhEXPneU92O555H8piRvaMtSIWfB++OoBgBszCxqLkBrOlvQbcbxnVGv+o1X54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gc4XjL5EuHDBKQZc9KZENAeMq/+oahftr2cmxvLnjwM=; b=XE5UwrbqqjCyHRMbf9uR7RpnGb
 neT4QYDYvW2lOT7HTSbwdfcleJjMvL7gBcLnRmXJtoX8uGVJQ++XdSQTxbvCEbbrGFodCQmZ2Siuh
 m/pVTEik57MKVk0Su+5GuDLtnbCcqvWH7Dtsu4zmvq6r6HdmLgS2PyjZFJ6CQVh5Q6Ks=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWUGU-0003ll-BR for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 06:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Gc4XjL5EuHDBKQZc9KZENAeMq/+oahftr2cmxvLnjwM=; b=4yNK6icE3icj78/Z5jgTDYUpNZ
 meqAdykMclbXUAmXPnY+taEuo2ZBnGs9S4rc8tWo9NDv/JAYb+IpTYoam3IlaOB2HQ4bI+qEhbkFP
 T7QytErxPpYn6NNBbTV0uQBICPSml8TxczM2ZDaQ5ZidDNmdfUTAImRmgO9vfWilrWbtZfPw6OXC5
 jMlllO3P5VHyohh43d/0d5kCphJMmDdnLRyzUxRqADd615zFAqtUAdQEnZArzXNSxxbC8axUva4qe
 D1Qw3Ya4FUZAiXqT4tZGtXE2PBpToDkZ0XpOCMvezR8GbkeOWQWqE21tVg2ghzmrIt58SfPRGBmOV
 86K6NqhA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uWUGM-000000047X1-0DQk;
 Tue, 01 Jul 2025 06:14:38 +0000
Date: Mon, 30 Jun 2025 23:14:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Qu Wenruo <wqu@suse.com>
Message-ID: <aGN8zsyYEArKr0DV@infradead.org>
References: <cover.1751347436.git.wqu@suse.com>
 <6164b8c708b6606c640c066fbc42f8ca9838c24b.1751347436.git.wqu@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6164b8c708b6606c640c066fbc42f8ca9838c24b.1751347436.git.wqu@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 01, 2025 at 03:02:34PM +0930, Qu Wenruo wrote:
 > To allow those multi-device filesystems to be integrated to use >
 fs_holder_ops:
 > > - Rename shutdown() call back to remove_bdev() > To be [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uWUGU-0003ll-BR
Subject: Re: [f2fs-dev] [PATCH v2 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
Cc: brauner@kernel.org, ntfs3@lists.linux.dev, jack@suse.cz,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 01, 2025 at 03:02:34PM +0930, Qu Wenruo wrote:
> To allow those multi-device filesystems to be integrated to use
> fs_holder_ops:
> 
> - Rename shutdown() call back to remove_bdev()
>   To better describe when the call back is called.

What is renamed back here?

> -static void exfat_shutdown(struct super_block *sb)
> +static void exfat_shutdown(struct super_block *sb, struct block_device *bdev)
>  {
>  	exfat_force_shutdown(sb, EXFAT_GOING_DOWN_NOSYNC);
>  }
> @@ -202,7 +202,7 @@ static const struct super_operations exfat_sops = {
>  	.put_super	= exfat_put_super,
>  	.statfs		= exfat_statfs,
>  	.show_options	= exfat_show_options,
> -	.shutdown	= exfat_shutdown,
> +	.remove_bdev	= exfat_shutdown,

Please also rename the function so that they match the method name.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
