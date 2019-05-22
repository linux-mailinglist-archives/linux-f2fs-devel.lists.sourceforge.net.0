Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5A5266AB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 May 2019 17:10:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTSsc-0005LR-4k; Wed, 22 May 2019 15:10:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1hTSsa-0005LI-DW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 May 2019 15:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FEpLTp6t9Bj8cEZnHYwVHtekMHW40hqnqkWrqhgRy+w=; b=mkuoSDE9CEBnJsAlnDs565CLrM
 Sqa82IzGCoq+w/KdjwKB4uJ38va4KofRANQ5rBei5NEp1OpynifMcIUVbtEzbpW8N7zmF88dEny9W
 qfDnsiNKQsOEro3WYVxhW7QR3lf1IAiXZTL7Mck0CkVUGpopgKAUE3VP/z0kkbHOeR3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FEpLTp6t9Bj8cEZnHYwVHtekMHW40hqnqkWrqhgRy+w=; b=RUN2Nz04lKP+wDyPTh2sfdZpM1
 /EUidTnGVn1wICAUeJFnWqkgPqsKYgTJ15SHuHRX+QGJ84278Vq9HMejlXMLRE+FeKsSZcqrj9JVH
 mpaZ9Cwvn+xrvXgzeCrShoD5xeAoxhl6MUk/yuhXUaz6bW+BR7nzBV25AJfiBjNn0kaQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTSsY-00HKYC-4I
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 May 2019 15:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FEpLTp6t9Bj8cEZnHYwVHtekMHW40hqnqkWrqhgRy+w=; b=QEF+xA3x6vvUPujuP05sXLntB
 0qvtE9Bn/WTayOl8HqiYAfphd/jJWWP6QKE4USd2xYeKvHr6Le15YeRKNcFL3uJzvIs6WGZn//JRY
 gLKB3mBWGGOX3jaREH1K5eGZuh7PjnWIC5qtY7HQwwHR7yP6YXNdoQWG8jtR5z7vwZvy6gij8LEez
 q3b8aeHNn0hnobvFBvVaDwYJukRnXn21FwfvhSCe3tF+QPqkpYA2DDWZui9PUmGAyf69QU1fVfhyA
 z25C8ODYNMWQaPQndCv19GIigt28GmabipvGE28egqs5SMCZ2CzEQU7vvPKPalvnYkg+2AgQtCvh3
 Me2W2fjlw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hTSsQ-00058J-7f; Wed, 22 May 2019 15:09:58 +0000
Date: Wed, 22 May 2019 08:09:58 -0700
From: Matthew Wilcox <willy@infradead.org>
To: sunqiuyang <sunqiuyang@huawei.com>
Message-ID: <20190522150958.GC6738@bombadil.infradead.org>
References: <20190522040530.37886-1-sunqiuyang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522040530.37886-1-sunqiuyang@huawei.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hTSsY-00HKYC-4I
Subject: Re: [f2fs-dev] [PATCH v4 1/1] f2fs: ioctl for removing a range from
 F2FS
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 22, 2019 at 12:05:30PM +0800, sunqiuyang wrote:
> +static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
> +	__u64 block_count;
> +	int ret;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +
> +	if (f2fs_readonly(sbi->sb))
> +		return -EROFS;
> +
> +	if (copy_from_user(&block_count, (__u64 __user *)arg, sizeof(__u64)))
> +		return -EFAULT;

You can just call get_user() here.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
