Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D50F910FF5F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2019 14:57:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ic8g7-0007IE-6v; Tue, 03 Dec 2019 13:57:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1ic8g6-0007I7-5J
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 13:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pGZjUh8ellhVGI9ssg4DQAJRtWM/oSsrAhWz58uDLYE=; b=fqiI8G3kwxhwfasQ4lkI9QpxDA
 2SNse82huYCpP7sV9QlvPoqRGSP42vo07LygqAaLTYQxjEwOj0Anm0BVr8kUmIZ6q26L2JHhFr+j1
 1xqKgWJQItDrDtzdWBFyTATR5IecgA1LZBT7AmIBWBPZVP9xHN7L24+dwdphhVsbpxJc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pGZjUh8ellhVGI9ssg4DQAJRtWM/oSsrAhWz58uDLYE=; b=P03HdLV6yDyg+NDRo2Z/pUlqqf
 EeUlwKOfhY3MkCVHhTqUhSb5EeN1YukZF3zeWOuwf7VqGt2aeVhdqano5kFd6StTU+jR0bG5Q2Cjs
 Lq0NOVZzQjIRjSuPxdjBRTPIILvQjhMCi79lu5wiuzk+/mMYz2lXOSUnL2FPzxmt/rK8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ic8g4-005plv-8Y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 13:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pGZjUh8ellhVGI9ssg4DQAJRtWM/oSsrAhWz58uDLYE=; b=K+oWswS7BbZQhmXrTzt62YVxf
 mKNwgluw/QFfsuhI2q2SwT2RGIfB+UDz+XkbodHVayXzf4yZ7U49NGvpJETvrCpbzXtFKKe0ncN5F
 z6psPTwUdiyKtaWK2e1noIWYD+8MPgF0q5TJg5ftlWJ0jKgOyoxoykYbaP8J2zz7psj19Eh4snUbU
 hfs/OXm9cR1EtryubmeT6YOH4/24FbG8gPGIVAQnIfvxnFFjfFQFRCnUIHBOMbBk35mty6yv3ZH+w
 p1QwiAlusOVQVbSUVFmbnmZjsqCs/12YIeIKqZgxSOg3M5PdmftpMCXuZBdzfMwupQO1aGNv04Zcz
 c0SdgoDgw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ic8fb-0005Ec-5g; Tue, 03 Dec 2019 13:56:51 +0000
Date: Tue, 3 Dec 2019 05:56:51 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <20191203135651.GU20752@bombadil.infradead.org>
References: <1575377810-3574-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575377810-3574-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ic8g4-005plv-8Y
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

On Tue, Dec 03, 2019 at 08:56:50PM +0800, Tiezhu Yang wrote:
> There exists many similar and duplicate codes to check "." and "..",
> so introduce is_dot_dotdot helper to make the code more clean.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> 
> v2:
>   - use the better performance implementation of is_dot_dotdot
>   - make it static inline and move it to include/linux/fs.h

Ugh, not more crap in fs.h.

$ ls -l --sort=size include/linux |head
-rw-r--r--  1 willy willy 154148 Nov 29 22:35 netdevice.h
-rw-r--r--  1 willy willy 130488 Nov 29 22:35 skbuff.h
-rw-r--r--  1 willy willy 123540 Nov 29 22:35 pci_ids.h
-rw-r--r--  1 willy willy 118991 Nov 29 22:35 fs.h

I think this probably fits well in namei.h.  And I think it works
better with bare 'name' and 'len' arguments, rather than taking a qstr.

And, as I asked twice in the last round of review, did you benchmark
this change?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
