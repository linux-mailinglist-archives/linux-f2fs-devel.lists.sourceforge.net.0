Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A98A14A80
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2025 08:56:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYhDM-0002GV-SC;
	Fri, 17 Jan 2025 07:56:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+61d77501dfe03cdea103+7817+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1tYhDL-0002GF-5v for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 07:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0xS4rzAwShP4fR0GmRf+Y/L+j7Nhbi6WmSe8J0Qupus=; b=RY8fDDXoNyRVkAgYGuLpRP9M+7
 CegEG1tdDQBIgMAB5ztDal95SKR9fM9C6/wuUP0HCQcrNObf9Xa8hTWAsnsWpzfTJv6vfWcLxrbRh
 uzH9Z8+4oRQNrjsZps3VJnhRRuvdmPpb181P54oC1lYKgobjHVT0q2PSpruRcb8fBe7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0xS4rzAwShP4fR0GmRf+Y/L+j7Nhbi6WmSe8J0Qupus=; b=cGJ+NwhpmZluVIACow6F5pPI+A
 iLTJISEThL+63CAG2xHMFW8OynaS+yte19u1vkv3iSL48AJcj9sOMebx8JLDEjbevghBA5mMQE4gE
 nFzbwMKlp++zjgWNq3hjNrdO4Dg3eLjj25TAXlGj3uozR7AqhBDF7C0U813q8qxcQXic=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYhDI-0007Zn-NY for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 07:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0xS4rzAwShP4fR0GmRf+Y/L+j7Nhbi6WmSe8J0Qupus=; b=3g8uUr/zQeamxBYJg5IR9w1nI5
 4XFglwglcwD6Kg+PhuCwG7MVHgvS5R/Pv5qLbbjmqEPK6DcIdD8PqbKmKt2IqippGnsPrcU8W8Ymy
 XYnki7fkGVODbJ/QGQkw95oNIYJRFIlp6gFu4h4wfGz+AXhghuLQOG4XlVtrU+INYLUoGcKddyaCm
 q3GJGEWpcbQcUCO0eIRoTyJ1iV3dj8zetOQr9Rbg7SOb/YBakeHaz9vZ9YgflNRZZP5NVMotg68rR
 6TGchrX0Hlb2sgEsRFJEjDaIE7qkOcAzCPou0RQ4xolbPR3/9ssMsF8+dP0kUVg/7qGKwYqvmaaHR
 0EfZr12g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tYhD7-0000000HGFi-3cg9; Fri, 17 Jan 2025 07:56:09 +0000
Date: Thu, 16 Jan 2025 23:56:09 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Z4oNGYJrN-XGX87M@infradead.org>
References: <20250115221814.1920703-1-jaegeuk@kernel.org>
 <20250115221814.1920703-2-jaegeuk@kernel.org>
 <Z4imEs-Se-VWcpBG@infradead.org> <Z4k_nKT3V1xuhXGc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4k_nKT3V1xuhXGc@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 16, 2025 at 05:19:24PM +0000, Jaegeuk Kim wrote:
 > > mean a invalidate_inode_pages2_range. Which is a strange use of the >
 > word. what are the use cases? Why is this queued up to a thread [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tYhDI-0007Zn-NY
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: register inodes which is able to
 donate pages
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
Cc: linux-man@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 16, 2025 at 05:19:24PM +0000, Jaegeuk Kim wrote:
> > mean a invalidate_inode_pages2_range.  Which is a strange use of the
> > word.  what are the use cases?  Why is this queued up to a thread and
> > not done inline?  Why is this in f2fs and not in common code.
> 
> The idea is let apps register some file ranges for page donation and admin
> recliam such pages all togehter if they expect to see memory pressure soon.
> We can rely on LRU, but this is more user-given trigger. I'm not sure whether
> there's a need in general, hence, wanted to put it in f2fs first to get more
> concrete use-cases beyond this Android case.

Well, that's certainly not a file system feature.  Please build this
as generic infrastucture and send it to the linux-mm list.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
