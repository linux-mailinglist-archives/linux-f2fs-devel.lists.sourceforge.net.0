Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2d9ZOLBwRmp4VAsAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 16:07:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F966F8B21
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 16:07:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="U/9L+vWz";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=kmoVowej;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=UjuN26Gs;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=lst.de (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysLyTLr+qO3BM1Dqr4nbQKiU1AUDzRftTPPY6oIxtLw=; b=U/9L+vWzZXpTBcBe0T22W/GTw2
	lfG3gIfwBvyYWcJcFPMXlYXoevYUmu0KW0gcxYgKy/Q3wG+mSeIT49H875eHWaXkw1p50mnNy6jtl
	i3nWGWQf7LL/po99iI1BJLR9m3NaIRTxpdKA78MpJIPre0JqS+qs3q3EeFoyCBdbfuQg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wfI4a-00010C-EC;
	Thu, 02 Jul 2026 14:07:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1wfI4Z-000101-4f
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 14:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+nEHDZS1++8Q/bmxLvAJQa/55le8Uz9H1iW8kDWU5TA=; b=kmoVowejTAK6mDNlo8nA6t7qTe
 7U4TdYFw8G+AKHZKMuTkoRm0/RljK6cFE037xFW1s5KaA2FiAH82SOKoIZV++Rl2GEEto/Fguz9or
 +krhjixW/XwUrKBUpzasGYBn2Tc31FNA/28TBV8+iYxNl3hZ6nsU6dLqojn5FCoUmM1Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+nEHDZS1++8Q/bmxLvAJQa/55le8Uz9H1iW8kDWU5TA=; b=UjuN26Gs3uwPWaRTGxAXqPFdBG
 icWQs/Mf30Q2eyROFyOVngXeFZyK1S0BbQvICTowbLtLyp3UiXNfz5BmxgbhLWKK/qbn4x5KlTag7
 tj3NLoYsprHj5HEZC3Sj4oBz7eCi2Y8X10E16hAGhrOCccOXO0XgTVKliKh0JganjrHU=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wfI4W-0003CG-Sp for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 14:07:23 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 90D9968BEB; Thu,  2 Jul 2026 16:07:05 +0200 (CEST)
Date: Thu, 2 Jul 2026 16:07:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joanne Koong <joannelkoong@gmail.com>
Message-ID: <20260702140705.GE21339@lst.de>
References: <20260701000949.1666714-1-joannelkoong@gmail.com>
 <20260701000949.1666714-18-joannelkoong@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701000949.1666714-18-joannelkoong@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Looks good: Reviewed-by: Christoph Hellwig <hch@lst.de> In
 terms of merge logistics, I wonder if we should delay this and the previous
 patch to the next merge window so that we can minimize the cross-subsystem
 merge pain with more file system iomap convers [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1wfI4W-0003CG-Sp
Subject: Re: [f2fs-dev] [PATCH v2 17/18] iomap: pass iomap_next_fn directly
 instead of struct iomap_ops
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
Cc: "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, Jan Kara <jack@suse.cz>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, djwong@kernel.org,
 Carlos Maiolino <cem@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Chunhai Guo <guochunhai@vivo.com>, Dan Williams <djbw@kernel.org>,
 Naohiro Aota <naohiro.aota@wdc.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Zhang Yi <yi.zhang@huawei.com>,
 willy@infradead.org, hch@lst.de, Yuezhang Mo <yuezhang.mo@sony.com>,
 hsiangkao@linux.alibaba.com, Gao Xiang <xiang@kernel.org>,
 "open list:EXT2 FILE SYSTEM" <linux-ext4@vger.kernel.org>,
 Namjae Jeon <linkinjeon@kernel.org>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 "open list:FUSE FILESYSTEM \[CORE\]" <fuse-devel@lists.linux.dev>,
 brauner@kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:NTFS3 FILESYSTEM" <ntfs3@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, "open list:GFS2 FILE SYSTEM" <gfs2@lists.linux.dev>,
 "open list:FILESYSTEM DIRECT ACCESS \(DAX\)" <nvdimm@lists.linux.dev>,
 Hongbo Li <lihongbo22@huawei.com>, linux-fsdevel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>,
 "open list:EROFS FILE SYSTEM" <linux-erofs@lists.ozlabs.org>,
 "open list:BTRFS FILE SYSTEM" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:joannelkoong@gmail.com,m:ritesh.list@gmail.com,m:jack@suse.cz,m:mikulas@artax.karlin.mff.cuni.cz,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:almaz.alexandrovich@paragon-software.com,m:clm@fb.com,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:guochunhai@vivo.com,m:djbw@kernel.org,m:naohiro.aota@wdc.com,m:zbestahu@gmail.com,m:miklos@szeredi.hu,m:yi.zhang@huawei.com,m:willy@infradead.org,m:hch@lst.de,m:yuezhang.mo@sony.com,m:hsiangkao@linux.alibaba.com,m:xiang@kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:viro@zeniv.linux.org.uk,m:jefflexu@linux.alibaba.com,m:jaegeuk@kernel.org,m:agruenba@redhat.com,m:axboe@kernel.dk,m:fuse-devel@lists.linux.dev,m:brauner@kernel.org,m:jth@kernel.org,m:tytso@mit.edu,m:ntfs3@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:
 gfs2@lists.linux.dev,m:nvdimm@lists.linux.dev,m:lihongbo22@huawei.com,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,m:riteshlist@gmail.com,m:hyclee@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[48];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,suse.cz,artax.karlin.mff.cuni.cz,kernel.org,paragon-software.com,fb.com,dilger.ca,linux.ibm.com,linux.alibaba.com,vivo.com,wdc.com,szeredi.hu,huawei.com,infradead.org,lst.de,sony.com,vger.kernel.org,suse.com,zeniv.linux.org.uk,redhat.com,kernel.dk,lists.linux.dev,mit.edu,lists.sourceforge.net,samsung.com,lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lst.de:mid,lst.de:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76F966F8B21

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

In terms of merge logistics, I wonder if we should delay this and
the previous patch to the next merge window so that we can minimize the
cross-subsystem merge pain with more file system iomap conversion.
If none of them actually happen until rc6 or so, orif  the merges aren't
painful we could still pick them up late in the merge window.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
