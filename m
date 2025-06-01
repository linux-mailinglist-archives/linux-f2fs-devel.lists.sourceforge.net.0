Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C904FAC9D69
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Jun 2025 02:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09pVby1P5OH7MT1k4Ob1ZU5xyGpRHbGMFtS0Yz7iSB0=; b=DnqVYM/eQTXSsiDHdchOdeFV8b
	eZD8B5YNSYRkO6c9K4fC+b3lPPNTnwPEMwthW17EwngdXJc6tSSsjIWB8fC/7zvxVMrDJsIh8YgX0
	/OOnEv0JRHFjTk27pPXTfkohXDwk/cHMxNZyq4zeQLQeU9iH2mBz3sJ252kpndcX5ZmI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uLWWz-0007OP-DR;
	Sun, 01 Jun 2025 00:26:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uLWWx-0007OI-6b
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 01 Jun 2025 00:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5rMEOV3KLFf+UgtAPaHUd4YMhA+OdnA8tVR26hQhvHY=; b=ipMYUG1VNjzbizXlATCbEmrhKo
 Fd3bwdTvRI3tog+vrvp0imIvT+y6IyuxAfVPhcdGkhy7tzTmJ/1dQ4lSGUGnGITkWEkzuwwafjVHS
 kJ4AgSOWK19TuCLKYrIRbdNwdbwrrlOBN67AFnLCn58iviDREY02TE7U52ktjGEvr4gM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5rMEOV3KLFf+UgtAPaHUd4YMhA+OdnA8tVR26hQhvHY=; b=i+5UkxC1EZZPwkCPeyPnCkY7Tq
 VSE8MOGd6BBt82dbbqAKsBgesz6yTjsEaA+JY5RajJDo9h0Dnv06vP0TWx5YFYA6MlcfRmrZ104C1
 qVyeSlJjUF+fjDl7DZjyK0gHORmbGhkUpwMwlpBhGubtHNDTkGjU5SjQimJTEuW8apfM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uLWWv-0000ki-GW for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 01 Jun 2025 00:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5rMEOV3KLFf+UgtAPaHUd4YMhA+OdnA8tVR26hQhvHY=; b=Exm/mE4p4ROy2CB3jVoyT30S5s
 CZwAD3td2DHQhuXhoNsMlrGr6/4Fu+gZ5ZMxz3isum/jvx6wHBpY/HqfHzfV8O8mVca0YnPZdt0Ii
 TJUAhCQVf3ONs1apHQXVDwdA6Ki+CaSqyYrYQBREpHRyNGbOWuLG3w0EmHYmCd45IDdeLz7JWpHAB
 FLns5ip5T1x8h6GjA/YCEPKY0ADhUW2iKpDn/DXGLgnfRH6o/41Dh6L6PMlJ4l2kNcdWNaeQnWMlm
 4PTfCEflJTI5RzsbFZWtiB1H08ys0qYjSRqA+4DSIuhNZmLy2gJ9Qm1HjVY9ggkhrfUOA9LJA16NN
 Ds2tp2tg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uLWWa-0000000HB4K-15Hx;
 Sun, 01 Jun 2025 00:26:04 +0000
Date: Sun, 1 Jun 2025 01:26:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: syzbot <syzbot+c0dc46208750f063d0e0@syzkaller.appspotmail.com>
Message-ID: <aDueHCMDLPs2UtY2@casper.infradead.org>
References: <67b75198.050a0220.14d86d.02e2.GAE@google.com>
 <683b8ea2.a00a0220.d8eae.0020.GAE@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <683b8ea2.a00a0220.d8eae.0020.GAE@google.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, May 31, 2025 at 04:20:02PM -0700, syzbot wrote: >
 syzbot has bisected this issue to: > > commit
 80f31d2a7e5f4efa7150c951268236c670bcb068
 > Author: Christoph Hellwig <hch@lst.de> > Date: Thu Ma [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1uLWWv-0000ki-GW
Subject: Re: [f2fs-dev] [syzbot] [netfs?] kernel BUG in folio_unlock (3)
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
Cc: v9fs@lists.linux.dev, hdanton@sina.com, syzkaller-bugs@googlegroups.com,
 asmadeus@codewreck.org, jlayton@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, dhowells@redhat.com,
 netfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, May 31, 2025 at 04:20:02PM -0700, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit 80f31d2a7e5f4efa7150c951268236c670bcb068
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Thu May 8 05:14:32 2025 +0000

That's not possible; this commit is after the original report.

That said, there _is_ a double folio_unlock() in this patch, which
I'm about to send a fix for.  It's just not fixing the original report.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
