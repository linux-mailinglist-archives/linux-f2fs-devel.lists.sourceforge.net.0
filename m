Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D961256DCA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jun 2019 17:36:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hg9xy-0001RR-4c; Wed, 26 Jun 2019 15:36:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>)
 id 1hg9xw-0001R5-SN; Wed, 26 Jun 2019 15:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9G5PiDG0S7gskQAEA+1rG18NFPpT+WoUOG9H+94vGJo=; b=BvG8DYvPF76bAQK50MsclllqG9
 H6PN57Uf+fGJKewKTHnt50M+QK08FnbjnCDnaCowbPJrde9pCPN+A42a3eqfMyjQnFozgYhRUtx2V
 LyAu1vSK+onYoZ9Z/qrl3jV/2ynZjyJ79GQK3A081HOPUoiBpsbPorA3lmrAE0B/1Jqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9G5PiDG0S7gskQAEA+1rG18NFPpT+WoUOG9H+94vGJo=; b=LuX2JnM+lM/zK3iEMXShGeJdOE
 PiUctoSl78YvUQslnW5PPAWHfyzvpiQDzjNPycr4twYNSnQyvm5YAvxeEIoC+tlWMQ6u9Y7S/ApmD
 iFaxBaEJIuAPU/zC0onq8QeX9KKPdti+WoVCyN1Tp8+EKzpI3Qiod09jRdyS/QltMgFs=;
Received: from userp2130.oracle.com ([156.151.31.86])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hg9xy-00EUeb-W5; Wed, 26 Jun 2019 15:36:12 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5QFXoje151326;
 Wed, 26 Jun 2019 15:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=9G5PiDG0S7gskQAEA+1rG18NFPpT+WoUOG9H+94vGJo=;
 b=Mr0csDp/6gFDwuuR4WcTjSwEQhZRUvDp0wq3YeKCIR/ppK1h93X/GLwv9+Y3cvXAo/We
 nBBPCWspqpkQf8Ya9/6yEHadZ9h5/AK9JEwgQLT2OJ63YoS19u03moZ7UXD928KK75Tw
 IYGgl4G6FFtMYGPdEh6jhDWXC8Gi+dRHPoIK4U9EU9fQhY9zQayETLpTGjqGl7XpA008
 xvtm1tvTyzmAnCbVLIgcaAr+22UL4c7SemsbRVUkLI8sB/S8GoHCuFEiRRnlmAb3SWPf
 RtSXc0WG3A/565vb1OMt7fUapvm0eYSNFeeM5VPPlY8RA+hUmYz247kCS97awaKxof1X 1A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t9brtb5ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 15:35:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5QFZWnl185666;
 Wed, 26 Jun 2019 15:35:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 2t9accs0fq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Jun 2019 15:35:48 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5QFZlgQ186348;
 Wed, 26 Jun 2019 15:35:47 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2t9accs0fn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 15:35:47 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5QFZjvI031893;
 Wed, 26 Jun 2019 15:35:45 GMT
Received: from localhost (/10.159.137.246)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 26 Jun 2019 08:35:45 -0700
Date: Wed, 26 Jun 2019 08:35:42 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20190626153542.GE5171@magnolia>
References: <156151632209.2283456.3592379873620132456.stgit@magnolia>
 <156151633829.2283456.834142172527987802.stgit@magnolia>
 <20190626041133.GB32272@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626041133.GB32272@ZenIV.linux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906260182
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lkml.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hg9xy-00EUeb-W5
Subject: Re: [f2fs-dev] [PATCH 2/5] vfs: create a generic checking function
 for FS_IOC_FSSETXATTR
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
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>, hch@infradead.org,
 linux-btrfs@vger.kernel.org, clm@fb.com, adilger.kernel@dilger.ca,
 matthew.garrett@nebula.com, linux-nilfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-ext4@vger.kernel.org, josef@toxicpanda.com,
 reiserfs-devel@vger.kernel.org, dsterba@suse.com, jaegeuk@kernel.org,
 tytso@mit.edu, ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 jk@ozlabs.org, jack@suse.com, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 26, 2019 at 05:11:33AM +0100, Al Viro wrote:
> On Tue, Jun 25, 2019 at 07:32:18PM -0700, Darrick J. Wong wrote:
> > --- a/fs/btrfs/ioctl.c
> > +++ b/fs/btrfs/ioctl.c
> > @@ -373,10 +373,9 @@ static int check_xflags(unsigned int flags)
> >  static int btrfs_ioctl_fsgetxattr(struct file *file, void __user *arg)
> >  {
> >  	struct btrfs_inode *binode = BTRFS_I(file_inode(file));
> > -	struct fsxattr fa;
> > -
> > -	memset(&fa, 0, sizeof(fa));
> > -	fa.fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags);
> > +	struct fsxattr fa = {
> > +		.fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags),
> > +	};
> 
> Umm...  Sure, there's no padding, but still - you are going to copy that thing
> to userland...  How about
> 
> static inline void simple_fill_fsxattr(struct fsxattr *fa, unsigned xflags)
> {
> 	memset(fa, 0, sizeof(*fa));
> 	fa->fsx_xflags = xflags;
> }
> 
> and let the compiler optimize the crap out?

The v2 series used to do that, but Christoph complained that having a
helper for a two-line memset and initialization was silly[1] so now we
have this version.

I don't mind reinstating it as a static inline helper, but I'd like some
input from any of the btrfs developers (or you, Al) about which form is
preferred.

--D

[1] https://lkml.org/lkml/2019/6/25/533


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
