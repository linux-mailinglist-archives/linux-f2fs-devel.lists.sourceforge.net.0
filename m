Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E4C164B10
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 17:53:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4San-0007Yl-VC; Wed, 19 Feb 2020 16:52:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4Sak-0007YO-BX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 16:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cgHnf3SMrTZMA4DpDgtFfVIHiHWSF/Dqsrx7GRLBvxI=; b=KYC0a0ccmGi9DKXptWcMRO1xVh
 ZlTkVlYqj7qt5uPlygN8mVr1e1l/xukId49mpcxtgYNSFc4CXZ4+gZNiTOiZZtNOuoVnmbuKQTr0B
 sEFEnMud6wJ9Hm35l9IV6AZKH3d0rwAay7DcEwe9qN8IlkxEKuezJ/HXUNWpupRkzVa8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cgHnf3SMrTZMA4DpDgtFfVIHiHWSF/Dqsrx7GRLBvxI=; b=F2uN2UxYFv5f7HYxt8VSiei0W+
 yw/Jmu25JYbTaNeOQFUcoRptZM/pu5O+4tLzS09CWGNXwDLVl3irWpM6/8f9Lngd0H3ppUORE4v7T
 CV8fG5E52XIjZMRotV+5F+ilxEdCK4lLz6F/ILJf8GJBOE7WDMW6OQsS+JY9H6oApHRk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4Sai-00061h-Jv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 16:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cgHnf3SMrTZMA4DpDgtFfVIHiHWSF/Dqsrx7GRLBvxI=; b=H1FNokl1Ks6Q/eFXln6I/UnzU6
 uNPywSHLbBZMMZub1YA6iLdFROQLpb7R/fkeHp2sx0LOh1LezwyK8b9RGHm1SZgBBgV0hcuEYRTAQ
 merEyI+w6w69t8v9PstDfEANDQwcW54pT4F2pguMCpy3hjaFfoP4hfJjnowwZoEaPgkKVPELazSh7
 6MLj14ZI0IkhiXqV5kOdKJZhGS6aIbjkm7qAH2uiQ1ZhpJTCeJ83OSUkPpb8l4bDwSTNNn54WBzkn
 Xy0Vd/PJU5zw6BFXMmfy5bDA3dtZOsOmWEUwuKUFuf61CMwyRMl2Tf/PF4JJ6E7Tim/Qm4mru/2Bl
 SNgQBpHQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4SaX-0004DT-TU; Wed, 19 Feb 2020 16:52:41 +0000
Date: Wed, 19 Feb 2020 08:52:41 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200219165241.GR24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-14-willy@infradead.org>
 <20200219031044.GA1075@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219031044.GA1075@sol.localdomain>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4Sai-00061h-Jv
Subject: Re: [f2fs-dev] [PATCH v6 08/19] mm: Add readahead address space
 operation
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 18, 2020 at 07:10:44PM -0800, Eric Biggers wrote:
> > +``readahead``
> > +	Called by the VM to read pages associated with the address_space
> > +	object.  The pages are consecutive in the page cache and are
> > +	locked.  The implementation should decrement the page refcount
> > +	after starting I/O on each page.  Usually the page will be
> > +	unlocked by the I/O completion handler.  If the function does
> > +	not attempt I/O on some pages, the caller will decrement the page
> > +	refcount and unlock the pages for you.	Set PageUptodate if the
> > +	I/O completes successfully.  Setting PageError on any page will
> > +	be ignored; simply unlock the page if an I/O error occurs.
> > +
> 
> This is unclear about how "not attempting I/O" works and how that affects who is
> responsible for putting and unlocking the pages.  How does the caller know which
> pages were not attempted?  Can any arbitrary subset of pages be not attempted,
> or just the last N pages?

Changed to:

``readahead``
        Called by the VM to read pages associated with the address_space
        object.  The pages are consecutive in the page cache and are
        locked.  The implementation should decrement the page refcount
        after starting I/O on each page.  Usually the page will be
        unlocked by the I/O completion handler.  If the filesystem decides
        to stop attempting I/O before reaching the end of the readahead
        window, it can simply return.  The caller will decrement the page
        refcount and unlock the remaining pages for you.  Set PageUptodate
        if the I/O completes successfully.  Setting PageError on any page
        will be ignored; simply unlock the page if an I/O error occurs.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
