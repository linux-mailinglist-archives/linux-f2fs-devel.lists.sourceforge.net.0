Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B1D54A70C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jun 2022 04:50:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o0wcx-0007HY-HI; Tue, 14 Jun 2022 02:50:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaoliu719@gmail.com>) id 1o0wcv-0007HS-DD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 02:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LaVJJVoW1ZPNs1w8IwxxzimUXb+MOrA0NjgrLCWagYc=; b=AH1kuZq+uJWCxeswDWmYA7pAR6
 K9x6RpZR/Puuwne9WP/BkKutTeG2M+ntaxEjoEvFzYqA4fZEoaI1oOiI/uNWk2YqB6sUxsBc+/kRR
 hH3CD42zafLvcrCbZqBL2pWZlxaeWc/V1GyCjw19qjxrHfidrETmZxJF+cEG1U35SQmc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LaVJJVoW1ZPNs1w8IwxxzimUXb+MOrA0NjgrLCWagYc=; b=ekMcOSnotdhINE2+HCG29+ifqH
 G5QHmAacYoTGQTAJJN/U8FJfQxcwtqpIX7vPnYec4g+1EBdmpY7iIvD/NoGQL77eXPQvoecSrZlZ9
 KwV8oiSIKr07IJDMQNsxSnbDXCOMhNy16t5+kMWKJHdvvAQYpHcmBpz4ojotVyjM1Y9I=;
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o0wcp-00070Y-Hd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 02:49:58 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 o33-20020a17090a0a2400b001ea806e48c6so7820783pjo.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Jun 2022 19:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LaVJJVoW1ZPNs1w8IwxxzimUXb+MOrA0NjgrLCWagYc=;
 b=LrD1D7q7s9Bn9qtPByR7VUT0RmFu7eHKmvp0ikfKmyvM7vZ5y441etLy7xjuhlwsoi
 LLw7H+bXbgfXrGdevyLMp65fgB14CPP/Q+0CQBfGDJcuaq9g6x2IQRVXlfvADn1bINX+
 QCOGVUDzwfqZVD0Fice34E+asX0xM0YgQ9b8NtOBO2am93KsYr94c6TfjUX97cm1v2Pb
 tQptYXnuYqQHXdKgZrD6f+6NGPobQUkJ3eKKxvX7/6DbQbXVHiZTAcxVjaPc+kH6seDm
 xD3TlBaou+fCOX0XrMxLRpIJikT7XklIeD+ey25DHutvQLwxp3ssxF7xx/2pYNvH4xqn
 pYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LaVJJVoW1ZPNs1w8IwxxzimUXb+MOrA0NjgrLCWagYc=;
 b=uK49EgOfn4mD5HMAVBfyG+/B3bYt7Y1jdL9lGbcYaknZlufU6nB+Xn0YQAARyVX+6X
 qgvh0nuESVNBCzDGPP2n9jWHSi83M7iOv7v7o/ruawKjnWoC7FCDArGkfhyFYySIHUSt
 4SI8yEbCX/JFFO05IgBHinZ+H6pzmjMRgwSx78LCuXvFODUWD0HwlAgG/A6CI99Cta7o
 8lMznp4O8ruytRUlW/zxEIHE7FDctSytzTejOgQCemXTLaahaHD161Tw9fMnAZduL/Ut
 y/yJBYG7fhTt8isl68wjdKfr+usOOgjcAAjYxaDnF0fhZR0/s0dAQIn1KwYyxswRahla
 k7lg==
X-Gm-Message-State: AJIora8G/rp3uUqiRtoc625Ca4pKGfC7ht78B85I4RzVbH1Suct+NY5b
 ecbUjehrFNf54pOnstFwjbs=
X-Google-Smtp-Source: AGRyM1v/elZzkeRRgw6Rn0c31Ol5uWIHtPYsuOt7qNjxcWS9NHecfbB8Ze/UCez8IDdjcyw4g3/HLA==
X-Received: by 2002:a17:902:ecc9:b0:163:f779:f97a with SMTP id
 a9-20020a170902ecc900b00163f779f97amr2069128plh.167.1655174987197; 
 Mon, 13 Jun 2022 19:49:47 -0700 (PDT)
Received: from liuchao-VM ([156.236.96.165]) by smtp.gmail.com with ESMTPSA id
 z28-20020a62d11c000000b0051bc44f26d9sm6177916pfg.23.2022.06.13.19.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 19:49:45 -0700 (PDT)
Date: Tue, 14 Jun 2022 10:49:40 +0800
From: Chao Liu <chaoliu719@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, Chao Yu <chao@kernel.org>
Message-ID: <Yqf3RDuu4+rqmzSA@liuchao-VM>
References: <20220613020800.3379482-1-chaoliu719@gmail.com>
 <Yqaw3VTD46PAMN8O@casper.infradead.org>
 <Yqbu+BArbUNGvft9@liuchao-VM> <87czfc1nr8.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87czfc1nr8.fsf@meer.lwn.net>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 13, 2022 at 11:23:07AM -0600, Jonathan Corbet
 wrote: > Chao Liu writes: > > > On Mon, Jun 13, 2022 at 04:37:01AM +0100,
 Matthew Wilcox wrote: > >> On Mon, Jun 13, 2022 at 10:08:00AM +080 [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [chaoliu719[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [chaoliu719[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.43 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.43 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o0wcp-00070Y-Hd
Subject: Re: [f2fs-dev] [PATCH v2] docs: filesystems: f2fs: fix description
 about compress ioctl
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
Cc: linux-doc@vger.kernel.org, Chao Liu <liuchao@coolpad.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Yue Hu <huyue2@coolpad.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Wayne Zhang <zhangwen@coolpad.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 13, 2022 at 11:23:07AM -0600, Jonathan Corbet wrote:
> Chao Liu <chaoliu719@gmail.com> writes:
>
> > On Mon, Jun 13, 2022 at 04:37:01AM +0100, Matthew Wilcox wrote:
> >> On Mon, Jun 13, 2022 at 10:08:00AM +0800, Chao Liu wrote:
> >> > v2:
> >> > - s/file size/filesize/
> >>
> >> Why would you change it to be wrong?
> >>
> >
> > This is a suggestion from Chao Yu. Maybe he has some other considerations.
>
> Sorry, I should have replied to that.  I disagree with that suggestion.
> "Filesize" is not an English word, and there doesn't seem to be any
> reason to use it in our docs.
>
> <checks>
>
> We have to occurrences now - one already in the f2fs docs.  I think we
> shouldn't add more.  So my plan is to apply the first version of this
> patch.  Chao Liu: is there a reason why you didn't add the Reviewed-by
> from Chao Yu in the second version?

Sorry for my carelessness. I should have added it.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
