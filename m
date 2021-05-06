Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9419374EAB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 May 2021 06:46:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1leVuE-00041t-N8; Thu, 06 May 2021 04:46:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1leVuC-00041h-E5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 May 2021 04:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sYTrBeoy1jSJGyPsZs6ShFZN6is2VHL2O83s5BAzuYY=; b=ZbGUM5907UVVmjk0V4toFJb7VK
 lZCJ5l+haTZIuVdiGkWTWX5rKhOx+8E1JlAxhF0DYKjagiMPXrpPafavF26eO8wLGNpA3Xka0pQVR
 f1ND8JW0zJLz+btz+UpnPJ0rVozXI+6hcQzHmbpb5RW+V49i7rB2gmllIeqh2wIy2k8I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sYTrBeoy1jSJGyPsZs6ShFZN6is2VHL2O83s5BAzuYY=; b=dnmSAH+i6ByecQeswFtmYHKI22
 Dpo5BjcGGWFDWWh45dMxnsGf15NW/S4+DFFh92+mzDhyfiSbS/awcJw5ScSLB58Y5zAqdj7idTWqv
 CjtYTUUzgk7lbDCK2sv/9D5Dh9LSGwywaZ1f68os714qQ+enS6ElWeTgpxDzHGQme8A0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1leVu8-0002KO-5n
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 May 2021 04:46:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 032FF610FA;
 Thu,  6 May 2021 04:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620276383;
 bh=zdcpYsjq/LphvbQv7Zuthak4zPjOF67RloOr7IcUpVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IVQUJBNyHp5vKHHfgOo4IpQlo9/7fegK57l9M3nTuzqhuWZLNtGqQF4gpQVCzlGZd
 D6g1IITSgS4K1xXCc0Te09mDDUWDQnbn9GakeLEPQXEW0UtR2Ln0PKBfIxbj4NfMxs
 jNA5YB4B66FcwVZjlSI0n5acqeW6MY5/qm8SyKZ+wzMD7XYBU/w7nC8RThXRCle7Zs
 +870I3Gxqc9wRfugo4PICfeq2SMKX2D5ZAC4cloUzQSDox7iKrOYKvMnxIqwi2xzaV
 VLqx2ujLnh/Pq4UDuTmZN8c8Lf+Bj1laUVCSAZbcmAJzVl5mlxfJ9EzzfVEgUS42oL
 8DZd1RsNwujkA==
Date: Wed, 5 May 2021 21:46:21 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YJN0nTgadoq8vDaG@google.com>
References: <CGME20210429062005epcms2p352ef77f96ab66cbffe0c0ab6c1b62d8a@epcms2p3>
 <20210429062005epcms2p352ef77f96ab66cbffe0c0ab6c1b62d8a@epcms2p3>
 <3a0ab201-9546-d523-abc7-79df5f637f14@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3a0ab201-9546-d523-abc7-79df5f637f14@huawei.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1leVu8-0002KO-5n
Subject: Re: [f2fs-dev] [PATCH] f2fs: set file as cold when file
 defragmentation
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/06, Chao Yu wrote:
> On 2021/4/29 14:20, Daejun Park wrote:
> > In file defragmentation by ioctl, all data blocks in the file are
> > re-written out-of-place. File defragmentation implies user will not update
> > and mostly read the file. So before the defragmentation, we set file
> > temperature as cold for better block allocation.
> 
> I don't think all fragmented files are cold, e.g. db file.

I have a bit different opinion. I think one example would be users want to
defragment a file, when the they want to get higher read bandwidth for
usually multimedia files. That's likely to be cold files. Moreover, I don't
think they want to defragment db files which will be fragmented soon?

> 
> We have separated interface (via f2fs_xattr_advise_handler, e.g. setfattr -n
> "system.advise" -v value) to indicate this file is a hot/cold file, so my
> suggestion is after file defragmentation, if you think this file is cold, and
> use setxattr() to set it as cold.
> 
> Thanks,
> 
> > 
> > Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> > ---
> >   fs/f2fs/file.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index d697c8900fa7..dcac965a05fe 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -2669,6 +2669,9 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
> >   	map.m_len = pg_end - pg_start;
> >   	total = 0;
> > +	if (!file_is_cold(inode))
> > +		file_set_cold(inode);
> > +
> >   	while (map.m_lblk < pg_end) {
> >   		pgoff_t idx;
> >   		int cnt = 0;
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
