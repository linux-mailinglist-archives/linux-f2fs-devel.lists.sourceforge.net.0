Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4147C1187DF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Dec 2019 13:14:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieeP7-0005OD-OW; Tue, 10 Dec 2019 12:14:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1ieeP7-0005O2-Ds
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Dec 2019 12:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F0mMCaOeB48CYx+gzJAQm0OX3KEZmwC3GLdDDtsdGeI=; b=Je4Ajq1QnPTKwvhIufK0V4lcA/
 AFmavIPkif6Ms4eHBlq7qrMOFKq7d/j6sYJ3QyVUem4XGPXXt0nAgK1gguuMh+lx1SOZsfAYn2HHf
 oQ8KAbVH3ok1GBpgBrRcDl0sgK6fmItr9FpQbc2MEgBw222UARRDDwHvMEGYE8s1nDFA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F0mMCaOeB48CYx+gzJAQm0OX3KEZmwC3GLdDDtsdGeI=; b=MU1Z5Go6EfYmAbo8V84O2Fh090
 8eGDbJnF5zMRNkyiIWWq2zbeJZAc0VqVNtP1ynKsDjXSdIvhfc0ffAOuFtXYTy5ZmOy2qWB0cgvle
 Yzv74YRql8Tk/LDPtH1LXV3bdmBoljBQFgCCU7pl9te6SblYH3nM3V0vOuFCKRm6Ry4k=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieeP5-00Go3V-JH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Dec 2019 12:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F0mMCaOeB48CYx+gzJAQm0OX3KEZmwC3GLdDDtsdGeI=; b=gKt+N1udFVuqZkm9Q1WZ3ZTtq
 m6mEP1vzuDG7lRrkUHUk9W5Q25t2lE02ARnkE0GsL6HUxtKVyMVsmD69mBnwxcUjP2Edu9sY+HOzQ
 wp9rknr6v6/StM6PehdiSu8gd9AYCB1GHOQT3B+s3EiKs1vmbuj+pFnExJbFPY3ur26X0lbFGOtxi
 j9EoQWf5wVv+4XnpyPPOSG+WstVGVHqjfFG/AVLC4iZQfdpBj51vljYYo6gk2h6UMDsQFhgEc3Vem
 BIEMkdxpCz94rs5SA0CkuIfFvviiNAYPh55wbdMtUckmgJOjExrqcdhE1KRgqw17dQOr0Cdmp9edZ
 IvyvlHLJA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ieeOc-00009F-9f; Tue, 10 Dec 2019 12:13:42 +0000
Date: Tue, 10 Dec 2019 04:13:42 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <20191210121342.GH32169@bombadil.infradead.org>
References: <1575979801-32569-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575979801-32569-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: loongson.cn]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ieeP5-00Go3V-JH
Subject: Re: [f2fs-dev] [PATCH v4] fs: introduce is_dot_or_dotdot helper for
 cleanup
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
Cc: ecryptfs@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Dec 10, 2019 at 08:10:01PM +0800, Tiezhu Yang wrote:
> There exists many similar and duplicate codes to check "." and "..",
> so introduce is_dot_or_dotdot helper to make the code more clean.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
