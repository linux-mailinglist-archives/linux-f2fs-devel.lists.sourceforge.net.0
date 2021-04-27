Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5276A36BF4C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Apr 2021 08:30:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbHEl-0006U0-Jf; Tue, 27 Apr 2021 06:30:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+3bf7d5fa8a5451b8b2eb+6456+infradead.org+hch@casper.srs.infradead.org>)
 id 1lbHEj-0006Th-GV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 06:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r/PKhDSOpuWVr+iFptHfckso/hHr0MElpssnEZU9ivc=; b=IfX3uGzlOsAG69tNQ5jCzOmOxT
 wErKcm+SSooSjCO7wHOp6AfvHsGLyGUu/MGAbGbt8tXBzf64Qbz6Asdxz8al8Etnz7alVTeOCH/Ll
 SIJE5cV2uBASSMUrrJ2x+Dq08p0+O3NvAjBCQkaqK4/w9NROHHbL9i1yzIYVNrlVRrbs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r/PKhDSOpuWVr+iFptHfckso/hHr0MElpssnEZU9ivc=; b=KXGYh2cuKeenfx6Jb3E5hf/6mz
 ZgpVoJnmL97SaWu6S1UAInK46GTsAWtOSdbvUseH5HmEhryzIYhn2B1XKQRZ6juweXyiX2hxSOaSI
 mycwWQ/FduUR33N8BvGiRYdASQTOucy+hDOcc3Dyb0WZnZ+WjoSYgOniB0tYh+Hd3JXk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lbHEZ-00Fjx5-VO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 06:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=r/PKhDSOpuWVr+iFptHfckso/hHr0MElpssnEZU9ivc=; b=t9mh6FBuC9Q6m6Enq+ly4WxESH
 mT9pTb/kWbZcUPQ/2+eQFn4c3qeB+Uacs9KFcE/oh+/JwyoYXcZvkoaxwwT7pieJlc35Qe1JIbm6r
 ZOGJAr21vCmO7XF/wZXQAEuEpS7JVCSOWlWyK2YKeFvrI65uv0DV7Q7soPVHJ3RS7RSRr4dWwTA60
 pPffe0QyygoYiTTiltxuCTKdm1XUCP8UaZm3fdB0oXG6/32cJMkIT9eYHRIbWYmInYJXXBGDo7OZT
 w4bTgXAYjwnJAVam9HyTeanfOzo4t1YlNvSLe6ACMjwSPdPnHSwL+aY1POS5JqZR2WFT1gZcb2FwG
 I8/7E5ww==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lbHDX-006ZEG-GN; Tue, 27 Apr 2021 06:29:12 +0000
Date: Tue, 27 Apr 2021 07:29:07 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Shreeya Patel <shreeya.patel@collabora.com>
Message-ID: <20210427062907.GA1564326@infradead.org>
References: <20210423205136.1015456-1-shreeya.patel@collabora.com>
 <20210423205136.1015456-5-shreeya.patel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423205136.1015456-5-shreeya.patel@collabora.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
X-Headers-End: 1lbHEZ-00Fjx5-VO
Subject: Re: [f2fs-dev] [PATCH v8 4/4] fs: unicode: Add utf8 module and a
 unicode layer
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
Cc: tytso@mit.edu, drosen@google.com, ebiggers@google.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, kernel@collabora.com, adilger.kernel@dilger.ca,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, andre.almeida@collabora.com,
 linux-ext4@vger.kernel.org, krisman@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Apr 24, 2021 at 02:21:36AM +0530, Shreeya Patel wrote:
> utf8data.h_shipped has a large database table which is an auto-generated
> decodification trie for the unicode normalization functions.
> We can avoid carrying this large table in the kernel unless it is required
> by the filesystem during boot process.
> 
> Hence, make UTF-8 encoding loadable by converting it into a module and
> also add built-in UTF-8 support option for compiling it into the
> kernel whenever required by the filesystem.

The way this is implemement looks rather awkward.

Given that the large memory usage is for a data table and not for code,
why not treat is as a firmware blob and load it using request_firmware?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
