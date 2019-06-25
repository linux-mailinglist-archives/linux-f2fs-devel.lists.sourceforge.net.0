Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E38CD520DB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2019 05:06:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hfbmS-000887-5N; Tue, 25 Jun 2019 03:06:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1hfbmO-00087v-5E
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jun 2019 03:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y1nTqvm5zm2oVuuxHsrGpbU4gEqHpmqSXspC8Bne9NM=; b=OzFQiJVKTrDBtpF4E+VgoazXxq
 dq1oGlHieez+zaSDhu5JTs4+svfXzZbOzqiF+/O/2s286shU7ZRiSkw+BJA/0fAEgJEmCXrnYI87p
 57x6maELRdHO/N+EAcSit4ViaxY3fX5p9NfL7T/Wt4yxeU3Qgz/gDFitmvKoZmPWxZec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y1nTqvm5zm2oVuuxHsrGpbU4gEqHpmqSXspC8Bne9NM=; b=f/Ik2+5CSeozKXkpadiZiK3Snh
 QHpBZzE6/6ir4E+BeBILRDgbwlyW9zmBhtqJgopf+g8EgP/RSPs9VFqY/9Vovvc5MvAQ9rPPOdvVD
 rPesqdSM3bMP/rXvd1qCBPFnpeU+IKmrQ4JJu9RgjRHJveP7DHhWUARC0vxc7YczcJAE=;
Received: from userp2130.oracle.com ([156.151.31.86])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hfbmT-008oJ1-7k
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jun 2019 03:06:03 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5P2xZkP183824;
 Tue, 25 Jun 2019 03:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=y1nTqvm5zm2oVuuxHsrGpbU4gEqHpmqSXspC8Bne9NM=;
 b=BXJlUqAKvMETApXDcsKgEZiNdrmlXkQGnY88kMW3AMxNKcXyyaE6UXAlpYECy+ntv7pH
 6uhEP1tj4tycY9LMVwQSwCJ1OFoN8XiURaWWP5MgMDhRGeWBYKJ5F+hDMXeWyXvzw09Y
 W93kGqDhXdEUxHJGprg0ZqzGMSQuXc6a6uPIBselde0/QnSPFrNudLSF4JrDCRjZHlSe
 PtPwNFzZ3qhrAqfZeA252/OTt3UOJ6W5XclgLFaB43nqCHJq7hk5QCcLKtksxGRz16et
 vcWpg2Ca0sMBi64yleW6uVf2BPJY2qw2eabFh6Nu+9cNmwvp3CwrP4l2harCRSOmeEeb 1g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2t9brt1hg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 03:04:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5P34h96101926;
 Tue, 25 Jun 2019 03:04:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 2t9p6tx2qw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 25 Jun 2019 03:04:55 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5P34tbP102400;
 Tue, 25 Jun 2019 03:04:55 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2t9p6tx2qp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 03:04:54 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5P34gx0001788;
 Tue, 25 Jun 2019 03:04:42 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Jun 2019 20:04:41 -0700
Date: Mon, 24 Jun 2019 20:04:39 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Jan Kara <jack@suse.cz>
Message-ID: <20190625030439.GA5379@magnolia>
References: <156116141046.1664939.11424021489724835645.stgit@magnolia>
 <156116142734.1664939.5074567130774423066.stgit@magnolia>
 <20190624113737.GG32376@quack2.suse.cz>
 <20190624215817.GE1611011@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624215817.GE1611011@magnolia>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9298
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250023
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hfbmT-008oJ1-7k
Subject: Re: [f2fs-dev] [Ocfs2-devel] [PATCH 2/7] vfs: flush and wait for io
 when setting the immutable flag via SETFLAGS
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
Cc: linux-efi@vger.kernel.org, linux-mm@kvack.org, clm@fb.com,
 adilger.kernel@dilger.ca, ocfs2-devel@oss.oracle.com,
 matthew.garrett@nebula.com, linux-nilfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org, josef@toxicpanda.com,
 reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
 jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 24, 2019 at 02:58:17PM -0700, Darrick J. Wong wrote:
> On Mon, Jun 24, 2019 at 01:37:37PM +0200, Jan Kara wrote:
> > On Fri 21-06-19 16:57:07, Darrick J. Wong wrote:
> > > From: Darrick J. Wong <darrick.wong@oracle.com>
> > > 
> > > When we're using FS_IOC_SETFLAGS to set the immutable flag on a file, we
> > > need to ensure that userspace can't continue to write the file after the
> > > file becomes immutable.  To make that happen, we have to flush all the
> > > dirty pagecache pages to disk to ensure that we can fail a page fault on
> > > a mmap'd region, wait for pending directio to complete, and hope the
> > > caller locked out any new writes by holding the inode lock.
> > > 
> > > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> > 
> > Seeing the way this worked out, is there a reason to have separate
> > vfs_ioc_setflags_flush_data() instead of folding the functionality in
> > vfs_ioc_setflags_check() (possibly renaming it to
> > vfs_ioc_setflags_prepare() to indicate it does already some changes)? I
> > don't see any place that would need these two separated...
> 
> XFS needs them to be separated.
> 
> If we even /think/ that we're going to be setting the immutable flag
> then we need to grab the IOLOCK and the MMAPLOCK to prevent further
> writes while we drain all the directio writes and dirty data.  IO
> completions for the write draining can take the ILOCK, which means that
> we can't have grabbed it yet.
> 
> Next, we grab the ILOCK so we can check the new flags against the inode
> and then update the inode core.
> 
> For most filesystems I think it suffices to inode_lock and then do both,
> though.

Heh, lol, that applies to fssetxattr, not to setflags, because xfs
setflags implementation open-codes the relevant fssetxattr pieces.
So for setflags we can combine both parts into a single _prepare
function.

--D

> > > +/*
> > > + * Flush all pending IO and dirty mappings before setting S_IMMUTABLE on an
> > > + * inode via FS_IOC_SETFLAGS.  If the flush fails we'll clear the flag before
> > > + * returning error.
> > > + *
> > > + * Note: the caller should be holding i_mutex, or else be sure that
> > > + * they have exclusive access to the inode structure.
> > > + */
> > > +static inline int vfs_ioc_setflags_flush_data(struct inode *inode, int flags)
> > > +{
> > > +	int ret;
> > > +
> > > +	if (!vfs_ioc_setflags_need_flush(inode, flags))
> > > +		return 0;
> > > +
> > > +	inode_set_flags(inode, S_IMMUTABLE, S_IMMUTABLE);
> > > +	ret = inode_flush_data(inode);
> > > +	if (ret)
> > > +		inode_set_flags(inode, 0, S_IMMUTABLE);
> > > +	return ret;
> > > +}
> > 
> > Also this sets S_IMMUTABLE whenever vfs_ioc_setflags_need_flush() returns
> > true. That is currently the right thing but seems like a landmine waiting
> > to trip? So I'd just drop the vfs_ioc_setflags_need_flush() abstraction to
> > make it clear what's going on.
> 
> Ok.
> 
> --D
> 
> > 
> > 								Honza
> > -- 
> > Jan Kara <jack@suse.com>
> > SUSE Labs, CR
> 
> _______________________________________________
> Ocfs2-devel mailing list
> Ocfs2-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/ocfs2-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
