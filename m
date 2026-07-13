Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MeywIqfSVGpifQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 13:57:27 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E801974A9D9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 13:57:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="XI/EH59+";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="gmzW/ji3";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=SbSOs3cM;
	dkim=fail ("body hash did not verify") header.d=infradead.org header.s=bombadil.20210309 header.b=Dly+lZGv;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=infradead.org (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+oDJo1NdUyXvA+Llr2FqDBE+fy0TpxmTEK8Vz4wJsA=; b=XI/EH59+Ewye6kOXzvnIxPi7cP
	wZlXN0nuXM+57QXZxKJ0jBU6PBoAEHyzKETRN1GsSjJ6kM3bqpjuC25e5oD0Aoz/Nm/IgBGW8SE1h
	Az9LQLV3F2/kSKwjyc3eVZzo76mIfLiV+SXswHnR+nOIqKblriuUWiua+9+5/vHd45V4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wjFHe-0006Z9-W5;
	Mon, 13 Jul 2026 11:57:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+55c33cd1421391a2a6eb+8359+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wjFHc-0006Z3-Ib for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 11:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XW8bvXN48RU/CJC/pUHGZ2MA9eav2lod4zf29rqDpck=; b=gmzW/ji35gpFlgReVHK+HxGNPm
 O1HXIXIrrJ1ChI2dDWPJzHyt8YIvmH3/4zkJK51c6IiOs8BGFYcrX+VYv1K4tllV3AFxjRJr21tC2
 Zp7CHyCM9FuJJgbcv00Hd82WFyLVlS4vgWvnNFTSf8utbXo8ughuPNaRqN68pt1Gpn3I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XW8bvXN48RU/CJC/pUHGZ2MA9eav2lod4zf29rqDpck=; b=SbSOs3cM3EWdRHNXk6k9qcj+WB
 EzfZ36hVX0ERzu7aFaIscw6YeVotW8YBgCVdJA4/uRayhcK7g+tkKQ5rvPUGTz7Sa+5/pQI0nk6U/
 AXwxc46jAQOijtJlFa5LD3hQbUOOwJGFC9GQ4QlKpYvrQyT4qxz7XhLg9bd68Hw/Ycgw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wjFHb-0000MU-Vi for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 11:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XW8bvXN48RU/CJC/pUHGZ2MA9eav2lod4zf29rqDpck=; b=Dly+lZGvOxZbzWL1tqIF9/Uu1z
 JFM8sEwMTUvuP6rfUAzD9LWWYnbKo9n0EHRO+FTNd17/VZ8ELcyZMIomQblRIQ/3b/GD3ksHI3VjO
 GLLVVxPWkBMJnFZhQJJeQ4Q5d7vW4uIp086mXKXQ84L/lpb/ogMAhrjsGGteoy/sbJYOLtP0vUt1V
 URKeyDX0mZ6cb33LjIKsniSVa4dU12oGilOROcJfOpPYZmnW2Tik6GkdFdTfN9pDHblEdSmcuktbL
 UNb218qy0A/kpCeO/CJFzY6/JLg95auuDrvPdZ5dRqOo6HzenlJz/WF5JrTFHQSls2X3WYf1JBUgz
 NvOjg1Dw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red
 Hat Linux)) id 1wjFHR-0000000966X-1EO3;
 Mon, 13 Jul 2026 11:57:01 +0000
Date: Mon, 13 Jul 2026 04:57:01 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Keith Busch <kbusch@meta.com>
Message-ID: <alTSjR-3gauVdr_6@infradead.org>
References: <20260710210646.3576365-1-kbusch@meta.com>
 <20260710210646.3576365-3-kbusch@meta.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260710210646.3576365-3-kbusch@meta.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > #include "internal.h" > > @@ -88, 13 +89,
 16 @@ int vfs_fileattr_get(struct
 dentry *dentry, struct file_kattr *fa) > struct inode *inode = d_inode(dentry);
 > int error; > > - if (!inode->i_op->fileatt [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wjFHb-0000MU-Vi
Subject: Re: [f2fs-dev] [PATCHv2 2/5] block: report direct io attributes
 through file_getattr
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
Cc: axboe@kernel.dk, linux-xfs@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, cem@kernel.org, aalbersh@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, tytso@mit.edu, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:kbusch@meta.com,m:axboe@kernel.dk,m:linux-xfs@vger.kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:cem@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:kbusch@kernel.org,m:tytso@mit.edu,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:from_mime,infradead.org:mid,lists.sourceforge.net:from_smtp,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E801974A9D9

>  #include "internal.h"
>  
> @@ -88,13 +89,16 @@ int vfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
>  	struct inode *inode = d_inode(dentry);
>  	int error;
>  
> -	if (!inode->i_op->fileattr_get)
> +	if (!inode->i_op->fileattr_get && !S_ISBLK(inode->i_mode))
>  		return -ENOIOCTLCMD;
>  
>  	error = security_inode_file_getattr(dentry, fa);
>  	if (error)
>  		return error;
>  
> +	if (!inode->i_op->fileattr_get)
> +		return bdev_fileattr(inode, fa);
> +
>  	return inode->i_op->fileattr_get(dentry, fa);

While this is correct, it reads a bit odd as the check above
required the S_ISBLK above.  I'd be tempted to move the
-ENOIOCTLCMD below the seurity check to mae it more obvious:

  	error = security_inode_file_getattr(dentry, fa);
  	if (error)
  		return error;

	if (!inode->i_op->fileattr_get) {
		if (!S_ISBLK(inode->i_mode))
			return -ENOIOCTLCMD;
		return bdev_fileattr(inode, fa);
	}

...



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
