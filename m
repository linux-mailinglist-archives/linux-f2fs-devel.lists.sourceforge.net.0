Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5470A10F529
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2019 03:47:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ibyDg-0002yA-C9; Tue, 03 Dec 2019 02:47:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1ibyDf-0002y3-2D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 02:47:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZcADr+fqCjkrKggMHp7c9VH2W4nKJ3vIQ/9FqtJ6+po=; b=D7paXD0fdIQswze9xhP+1/CH1U
 n0aVD1o8xitBFe/LfnbjM/xrthU/igjH1Nkv77QGL0t/Ghop2ISSE7CtTz/Ne/5nVyPS/tbeG52II
 bM80wJYWFWPqrFjcQ9C84cI39rOVaH03jCikgoRdXSkA30LRkDobaLXajHL/I7HEiPqw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZcADr+fqCjkrKggMHp7c9VH2W4nKJ3vIQ/9FqtJ6+po=; b=a611OGBu6RglK0WLRzVAyocsvI
 Q0j7ygmeYKwDnwRLdqnIBJ02Fqx8JP1JtKaMylPnrLGYfP2Tdo7c25ZZAaYW7rO2GcNYTAFkhNmMH
 WlufFKqYOOEYIR0Jfk1kNMbs/LgIZ7wj817IMPEg/TzEvEyYgztbE6n2LseT9bk/Mv9U=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ibyDc-005Lw3-QT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 02:47:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZcADr+fqCjkrKggMHp7c9VH2W4nKJ3vIQ/9FqtJ6+po=; b=ZKQ9aFJ8e7Bhuk3ldud6Rv7p/
 Je8/Oq4ghvtMDdZ8xuWLgrVCOvrGyDituzDk4crgA+cEk4nin2pU4fg8ut/8BbnezXZ6fW1zs4puf
 /NEQvnTLJjDVL6Ne/aiKA2DvBXW7SGEVg45+6RXCl/tkSRT2ggQfv9XtCwMTjM4HgP0RHeMLXzfaZ
 ILM/mwJWbX0+PMA+ItQzDIs6Fqmba7YXOgvaGwWfO7qJ1qR0yYQSrlf1tldOt/v/ylTnZztvmEbhf
 IuVdNzza1Der/TDr1frVSMfl/TZhKmijCNYX8JpZOXLykJreuOp23+d5Rg82kK6DIuCCRwCEEXOry
 J95N0jq/A==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ibyDB-0006M1-QQ; Tue, 03 Dec 2019 02:46:49 +0000
Date: Mon, 2 Dec 2019 18:46:49 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <20191203024649.GQ20752@bombadil.infradead.org>
References: <1575281413-6753-1-git-send-email-yangtiezhu@loongson.cn>
 <20191202200302.GN20752@bombadil.infradead.org>
 <357ad021-a58c-ad46-42bd-d5012126276f@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <357ad021-a58c-ad46-42bd-d5012126276f@loongson.cn>
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
X-Headers-End: 1ibyDc-005Lw3-QT
Subject: Re: [f2fs-dev] [PATCH] fs: introduce is_dot_dotdot helper for
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

On Tue, Dec 03, 2019 at 10:07:41AM +0800, Tiezhu Yang wrote:
> On 12/03/2019 04:03 AM, Matthew Wilcox wrote:
> > On Mon, Dec 02, 2019 at 06:10:13PM +0800, Tiezhu Yang wrote:
> > > There exists many similar and duplicate codes to check "." and "..",
> > > so introduce is_dot_dotdot helper to make the code more clean.
> > The idea is good.  The implementation is, I'm afraid, badly chosen.
> > Did you benchmark this change at all?  In general, you should prefer the
> 
> Thanks for your reply and suggestion. I measured the
> performance with the test program, the following
> implementation is better for various of test cases:
> 
> bool is_dot_dotdot(const struct qstr *str)
> {
>         if (unlikely(str->name[0] == '.')) {
>                 if (str->len < 2 || (str->len == 2 && str->name[1] == '.'))
>                         return true;
>         }
> 
>         return false;
> }
> 
> I will send a v2 patch used with this implementation.

Well, hang on.  If you haven't done any benchmarking, please do so
before sending a v2.  In particular, you've now moved this to being a
function call.  That might slow things down, or it might speed things up.
I also don't know if passing a qstr is going to be the right API --
let's hear from the filesystems affected by the API change that they're
OK with this change.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
