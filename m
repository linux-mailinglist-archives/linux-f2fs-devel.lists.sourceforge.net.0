Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3812CE5EA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 03:48:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kl18r-00073s-NE; Fri, 04 Dec 2020 02:48:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@redhat.com>) id 1kl18q-00073f-Iz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 02:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VBVcwXe0Xot4zj8M7WdfrfXxsjan5Uxa2ACFxEEuvJA=; b=J+7mqgChpKApcrh24B+i4Yryz6
 GemdMEZiDb6yPRPpu48Kcu3HNYOKpPiJpOnc5grhPmch6H/fdxW683VaLqF6C77g2deqy2RJv9eBt
 LRboq4YveJxzwXtyQD3tZWhk1jbdo5khhYrdAlakFiwctjI2JJCq5OJGAp+mzktgSGug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VBVcwXe0Xot4zj8M7WdfrfXxsjan5Uxa2ACFxEEuvJA=; b=iG3iDJN5UePjqPbrKCyMj4jGVJ
 nvcoVtX9lcmzGg7gyl+h4ZfghDnVQ1v80ZFafaP8jM0Fyn3VrjqOHwBFrvTnnbCL16L9P7W4qtjDX
 Pc2ZSVAMBs8YtZUqkv/9KCW2vVWu5cm7F0Bch36YCqzCIZ+alevIuc5y04zt0595P4AI=;
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1kl18g-000z71-QG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 02:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607050080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VBVcwXe0Xot4zj8M7WdfrfXxsjan5Uxa2ACFxEEuvJA=;
 b=aKapiidk5kP/nc2Ii3lQmDJQFb6xc1wS/QCMCIe2ExNjG20/bnn0R9WCBilH99lnEPhVqZ
 ruvYmG0dpVsLYlc6+sOdUqunqcPJaHyek5ucIGM61IimToBxkZ4f/bCzYSfCjWL5Q1a8oC
 T33bARStHj8zTc6Oamin4ZNX4CxwO5c=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-LVQZxHukN-SIJc40PEeRsA-1; Thu, 03 Dec 2020 21:47:58 -0500
X-MC-Unique: LVQZxHukN-SIJc40PEeRsA-1
Received: by mail-pj1-f69.google.com with SMTP id ob4so2467034pjb.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Dec 2020 18:47:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VBVcwXe0Xot4zj8M7WdfrfXxsjan5Uxa2ACFxEEuvJA=;
 b=HNSlkJSEWtuoN9rU7peOQAISRxPPwl1PQNsflTXPxDlEclENUBJLA/ZfjdchNwm5p9
 XBrF5ON6cLmhjVbJsVG9pg0ff6ajFZz2+iqLPA6GYTY/QWCG+BwrEkcPAPTnKoPzXZy7
 Nj5bVT8Jhlwg9Io8SyFe8DuhA57DdBrk1qJhUm9Ex7u1Iq5tCsYa+ZV4zkowLyo2vRtZ
 XJSMEBl+b+twmRgSA+wvL9+5RH7te7u5WcMMKkjAftM+64HtrOvY1UoUQne3R5FmiH1z
 3ym9scbX7ZmqtkMa64bwz3SWEL2271vV+wkoxTz5adREquB/1ICBbSlHJvur0FXZeabF
 SvqQ==
X-Gm-Message-State: AOAM532p4v6rr+yu3aJE6+C5mgUR6go6NyU+7ioqPjE58il/VjYZS1Qw
 rMcViWDSkqtS4d2O0bLhcw+rMfoJwkpQ0kxiQhxJjWk2eKpXmEiD8U3JaRJUiW8w0vaAyjQ3ENO
 DsP52HsECM1vusbezWIJ37+vUQrCgM63OS1cffA==
X-Received: by 2002:a17:90a:a786:: with SMTP id
 f6mr2105578pjq.104.1607050077567; 
 Thu, 03 Dec 2020 18:47:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxafF8YpV/xVIGGfNk00Gd3HTJHR0we7Pr5oZCjxJlSwb7P1KQx5BTk0Tq/APvl6dYzc7sp5w==
X-Received: by 2002:a17:90a:a786:: with SMTP id
 f6mr2105568pjq.104.1607050077367; 
 Thu, 03 Dec 2020 18:47:57 -0800 (PST)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 22sm584280pjw.56.2020.12.03.18.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 18:47:56 -0800 (PST)
Date: Fri, 4 Dec 2020 10:47:46 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201204024746.GC1963435@xiangao.remote.csb>
References: <20201203061715.60447-1-yuchao0@huawei.com>
 <X8k9UoUKcyThlJNU@gmail.com>
 <20201204003119.GA1957051@xiangao.remote.csb>
 <7b975d1a-a06c-4e14-067e-064afc200934@huawei.com>
 <20201204020659.GB1963435@xiangao.remote.csb>
 <3041968d-87d0-d2dc-822b-0bb4a94a365b@huawei.com>
MIME-Version: 1.0
In-Reply-To: <3041968d-87d0-d2dc-822b-0bb4a94a365b@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [63.128.21.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [63.128.21.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kl18g-000z71-QG
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: compress: support compress level
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
Cc: Eric Biggers <ebiggers@kernel.org>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 04, 2020 at 10:38:08AM +0800, Chao Yu wrote:
> On 2020/12/4 10:06, Gao Xiang wrote:
> > On Fri, Dec 04, 2020 at 09:56:27AM +0800, Chao Yu wrote:

...

> 
> > 
> > Keep lz4hc dirty data under writeback could block writeback, make kswapd
> > busy, and direct memory reclaim path, I guess that's why rare online
> > compression chooses it. My own premature suggestion is that it'd better
> > to show the CR or performance benefits in advance, and prevent unprivileged
> > users from using high-level lz4hc algorithm (to avoid potential system attack.)
> > either from mount options or ioctl.
> 
> Yes, I guess you are worry about destop/server scenario, as for android scenario,
> all compression related flow can be customized, and I don't think we will use
> online lz4hc compress; for other scenario, except the numbers, I need to add the
> risk of using lz4hc algorithm in document.

Yes, I was saying the general scenario. My overall premature thought is that
before releasing some brand new algorithm, it may be better to evaluate first
it'd benefit to some scenarios first (either on CR or performance side, or
why adding this?), or it would might cause lzo-rle likewise situation in the
future (and add more dependency to algorithms, you might see BWT-based bzip2
removal patch
https://lore.kernel.org/r/20201117223253.65920-1-alex_y_xu@yahoo.ca
(since I personally don't think BWT is a good algorithm as well)... Just FYI
... If i'm wrong, kindly ignore me :)

Thanks,
Gao Xiang

> 
> Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
