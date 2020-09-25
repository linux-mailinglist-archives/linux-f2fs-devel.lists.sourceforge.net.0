Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E630278EF9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Sep 2020 18:45:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLqr1-0001BI-7W; Fri, 25 Sep 2020 16:45:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kLqr0-0001BB-GA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 16:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VuW6qGzzuxVPyqm1oCHDsVB2lhJ9SNnnPwwWOz6XIbg=; b=jwvnVnHLHmsMVakaIdsuPvqzzj
 JwmFSTFUk54y03i0EPX/3TkxxyU/U/SowhG6yZSdDe+VyB+viPONjG0dupL8dyGjvq8ZyXQcbYESL
 6+9KFl3/VgHn1HHw197uD2iH5uK1acFy1CCv26O5UzYetx7B6S8ydATNtsYUVguJp9js=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VuW6qGzzuxVPyqm1oCHDsVB2lhJ9SNnnPwwWOz6XIbg=; b=ZqMX2Llp+uwJkkF/Qzb5r9ydr9
 pkczD78ADxEmvLI5k1gstf+uWDj47LXQA7rCLnJhrEkFRTpPEQwkz7oh8rZGySeSzm06P6Wb5rk1K
 C3xVDyK3MjctMAye7olR489/qEwLL+5IHAv2aI/cGqTflB0Jyg5gbMA1IY/mJvMAVs+c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kLqqw-005jMe-5D
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 16:45:50 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D562207C4;
 Fri, 25 Sep 2020 16:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601052340;
 bh=jCFSSAzfkPx0FSPQZ22vjowCCmUJwQx6Nnx+KhlIOzU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wjyiZ5KbaEaamDgZO/UH46Jx+G5zQ1OuC8xQnXkX5QjK3+dqnkXTgI310MPEtjdS0
 +6ejXQSItYHr02ZIjcXYVIfhXd2z9tbnPrQzJrYMvlhYt/rl9IzsxAwuZK7vtp+Bz8
 0YEwOtDDH30ohov6SWDlO6CeGJTIl2vtNANp9mHY=
Date: Fri, 25 Sep 2020 09:45:38 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200925164538.GB3315208@gmail.com>
References: <000000000000f9f80905b01c7185@google.com>
 <eb03a5c9-eb77-eb91-e17f-8a3273aab7da@huawei.com>
 <20200925163819.GA3315208@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925163819.GA3315208@gmail.com>
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kLqqw-005jMe-5D
Subject: Re: [f2fs-dev] KMSAN: uninit-value in f2fs_lookup
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
Cc: syzbot <syzbot+0eac6f0bbd558fd866d7@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, glider@google.com, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Sep 25, 2020 at 09:38:19AM -0700, Eric Biggers wrote:
> On Fri, Sep 25, 2020 at 05:06:33PM +0800, Chao Yu wrote:
> > Hi,
> > 
> > I don't see any problem here, thanks for your report. :)
> > 
> > Thanks,
> 
> What about if max_depth == 0 in __f2fs_find_entry()?  Then __f2fs_find_entry()
> would return NULL without initializing *res_page.

... and I now see Dan Carpenter already pointed this out.  I was a bit late!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
