Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEEF113C20
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Dec 2019 08:07:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iclER-0004bu-KB; Thu, 05 Dec 2019 07:07:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1iclEM-0004bI-Lp
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Dec 2019 07:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LMxh8PsOTdp3uRQncunavdBObTQIFTMPychpOdLcPaI=; b=ereos++XF2VsIhbW+ekPg0ebmQ
 ZuWzyRmrtzq8SZE0sh60Rk4omgofiGgjyO8RlCdyGPzu8naL2qjJb6CjpRIQkAR5NfZxbNc0uM9OA
 6xnoDGY8x7p/0tUVOnXD2ojNfA6PXGzN7O0SYxqqZWBMS+Bek8WQ+pN2+xYYHui5o3xA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LMxh8PsOTdp3uRQncunavdBObTQIFTMPychpOdLcPaI=; b=SuuVr3sNpVH2O+pWGwZ2rwKEYi
 gFOD749KhjB9Ow8NuAQo4AHBZ6jC6L5F8ILbyu5oF73Ust72WqBX8rc9yoKRYMs1b0gbUo8YfRzv6
 gGEbaNMlIFLs5gkdNnJtZFPfGJ67oJY5Ggoo1RF3h+qnqz+Q7ibvU7huw1IMb0sbksK8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iclEK-00ANf9-NN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Dec 2019 07:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LMxh8PsOTdp3uRQncunavdBObTQIFTMPychpOdLcPaI=; b=ttZfZk2NbSMy0oKG8mJmZ66Jj
 Fr2AaQPAQqEz8B84HALo6GcQCEvz6v2yxXag6Gy/NeuZOLwkz+gBEp23dDd+yR/qVEhJkP7Lj27Lk
 MfvFttoe/KNP8O0pMCqzioRjX9qHDS+PsLyRnO/1CMlsDkfPDZ3cZ1r1u3Wcy/ZDQT/RuLvQVGG4K
 UXQjHkpQNLXt+eg6Qj+SoFYbHmN17I6l+YXFi8nW0sipytrDTPPGYLilIqMGTyuHHSh2Wsb58lDEc
 yVX5I2tHXwNjpjfCJiA8HUoWnTAmyfb+Zbo4MaWO0emJolsCELJj6F6bvRQafPqYCOHC/9e6BgqFR
 24GFHE76Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iclDq-0008IY-St; Thu, 05 Dec 2019 07:06:46 +0000
Date: Wed, 4 Dec 2019 23:06:46 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <20191205070646.GA29612@bombadil.infradead.org>
References: <1575377810-3574-1-git-send-email-yangtiezhu@loongson.cn>
 <20191203135651.GU20752@bombadil.infradead.org>
 <0003a252-b003-0a8c-b4ac-6280557ece06@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0003a252-b003-0a8c-b4ac-6280557ece06@loongson.cn>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
X-Headers-End: 1iclEK-00ANf9-NN
Subject: Re: [f2fs-dev] [PATCH v2] fs: introduce is_dot_dotdot helper for
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

On Thu, Dec 05, 2019 at 08:56:07AM +0800, Tiezhu Yang wrote:
> > And, as I asked twice in the last round of review, did you benchmark
> > this change?
> 
> Before sending this v2 patch, I have done the test used with your test
> program and already pointed out the following implementation is better:

I didn't mean "have you run the test program i wrote".  I meant "have you
booted a kernel with this change and done some performance measurements
to see if you've changed anything".


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
