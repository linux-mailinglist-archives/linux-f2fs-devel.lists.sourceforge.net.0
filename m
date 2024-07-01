Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3397B91E6B4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2024 19:32:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOKtG-0001QV-5K;
	Mon, 01 Jul 2024 17:32:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <htejun@gmail.com>) id 1sOKtF-0001QO-0r
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Jul 2024 17:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KOquWB6R7jPlu+/gNBjC1zvoBMEzqFFKAHKl/0V4Xwg=; b=ebH4qcNEZu9KISBmPnnIDs78Lx
 ZScpztxGs8VsISRKUxYq7ZkV6n4T5lnZKSAmhLGQCMYQOHy8CmiSZXLq1LPygxanXMidB67xA7iMG
 9wF8gyTD73YC79oYId2qjZZkveGLwk/Ge0P8GXcd5shphgVci222R5WdOryBIwXm9wDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KOquWB6R7jPlu+/gNBjC1zvoBMEzqFFKAHKl/0V4Xwg=; b=lHiSKvlEJJe+r3a1KTMLYzYyxX
 UkBgAYpCdzipxuEJxPaDXr+KkXx1Wqf6hVxautQoQ+IxQU+ZwNYG03FHG4bwZM9XU1YX5i+mRzsKZ
 3ppTTO7USHxPbIf5yyOQCwycPIKH30dQI6RgvnX9wfFQ1PhT5n7hz24W8EvpVU4n/vXI=;
Received: from mail-pg1-f171.google.com ([209.85.215.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sOKtF-0001LM-FO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Jul 2024 17:32:33 +0000
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-7381b56fb6cso1294103a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Jul 2024 10:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719855147; x=1720459947; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=KOquWB6R7jPlu+/gNBjC1zvoBMEzqFFKAHKl/0V4Xwg=;
 b=gnAG8Lm7y2PcdALL8tBYFhw+N0Lfphd1w8ZHOXZu9kBBOiV+u2bmElU36i/NKHTwEu
 WmRFSH8Pbbn7f/xhm0bkjbzLn7WkJQHfQV+s8BgWtveLf9MlQsOjCLDyPsWFR3CyRXvZ
 26RO9tHvJDItOTqKnOLIPPP4WIqpbxaO51sXJoWpUVL3OpXwWli6EUh35Rz/XP2hOD/H
 P+VK9y30luebpIvn3iP8tqAaTdl08g5n+p2D2urEr+JYAmyKcZAnfw2DOgoAv0fYlFmn
 LtWBD4hzHTQHQ783P5hxsVDv6w2VzdTepKeAMA+S4J/pW1OMG11ikV6Ei4yazwbPJjx9
 gsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719855147; x=1720459947;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KOquWB6R7jPlu+/gNBjC1zvoBMEzqFFKAHKl/0V4Xwg=;
 b=OIJ8tUCifZgK0s8AmQA0GC+hduNnPvuPncbJPxAPaglrQOTI+UhEb1VKLze4SAfGOh
 tmF2b3cKjic1W0+kHjtexKPvDtNN/AWuEecSOcT7ndIc/MO6J7KCUPaNgfcRVFBcZU6E
 AcW2aplRTFf8uLq02+nYYyKvOsYEb54pQSchrKWTlnpmSUwtjfRKcxD706pXdk29/TXJ
 3ESIjh9gHWZzUt+m+TOl9MeOrarNOfXWlDLwbDyh4KtZ4MPfD1/19w3L1Y1qkSyd7M62
 LPTDhym2b4xolPQDaPFDPe3JjDMFFWHQSCU/uARVaqpHX5LqLDjmO0Ia6y2xSvA7yT9F
 GfZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8bgeis2da86eKf0Kk73fuZJDOwloqbokVvNIYPO+/fmf6Uxee/F7a8VKDyzxmBPDVStz8lx/R4PJ6VWMyiKUkc8s9cOjJndcjPNE2GtbliY+dGW/urw==
X-Gm-Message-State: AOJu0Yy9yf9M+WbcbzMJpq/Fd0dmPt4Ki9oKpgAeQGTEadOBifBSl8Ij
 vDAp29E99GeOg9wOideoC5xfvySHuavSswEEMo4RZKUc7mSmbigX
X-Google-Smtp-Source: AGHT+IGcwRW9DViCRjPwgEa62mvDogBZ+M8MLZrIQVFOfdrcOpInk15Gh5BLpx+aoJP25OEp5yLbyA==
X-Received: by 2002:a05:6a20:7aa1:b0:1be:e961:6a3a with SMTP id
 adf61e73a8af0-1bef626e7acmr4371786637.51.1719855146803; 
 Mon, 01 Jul 2024 10:32:26 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net.
 [141.239.149.160]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e3827sm69111705ad.85.2024.07.01.10.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 10:32:25 -0700 (PDT)
Date: Mon, 1 Jul 2024 07:32:23 -1000
From: Tejun Heo <tj@kernel.org>
To: Yi Sun <yi.sun@unisoc.com>
Message-ID: <ZoLoJ-uBo9qyAlMg@slm.duckdns.org>
References: <20240701075138.1144575-1-yi.sun@unisoc.com>
 <20240701075138.1144575-2-yi.sun@unisoc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240701075138.1144575-2-yi.sun@unisoc.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, On Mon, Jul 01, 2024 at 03:51:37PM +0800,
 Yi Sun wrote:
 > +/* > + * If a work may do disk IO, it is recommended to use struct io_work
 > + * instead of struct work_struct. > + */ > +struct io_work { > [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.215.171 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.215.171 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.171 listed in wl.mailspike.net]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [htejun[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1sOKtF-0001LM-FO
Subject: Re: [f2fs-dev] [PATCH v2 1/2] workqueue: new struct io_work
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
Cc: kent.overstreet@linux.dev, ebiggers@google.com, jiangshanlai@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 yunlongxing23@gmail.com, sunyibuaa@gmail.com, jaegeuk@kernel.org,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

On Mon, Jul 01, 2024 at 03:51:37PM +0800, Yi Sun wrote:
> +/*
> + * If a work may do disk IO, it is recommended to use struct io_work
> + * instead of struct work_struct.
> + */
> +struct io_work {
> +	struct work_struct work;
> +
> +	/* If the work does submit_bio, io priority may be needed. */
> +	unsigned short ioprio;
> +	/* Record kworker's original io priority. */
> +	unsigned short ori_ioprio;
> +	/* Whether the work has set io priority? */
> +	long ioprio_flag;
> +};

There are fundamental limitations to this approach in terms of
prioritization. If you tag each work items with priority and then send them
to the same workqueue, there's nothing preventing a low priority issuer from
flooding the workqueue and causing a priority inversion. ie. To solve this
properly, you need per-issuer-class workqueue so that the concurrency limit
is not shared across different priorities.

Now, this limited implementation, while incomplete and easy to defeat, may
still be useful. After all, ioprio itself, I think, is flawed in the same
way. If f2fs wants to implement this internally, that's okay, I suppose, but
as a generic mechanism, I don't think this makes a lot of sense.

Thanks.

-- 
tejun


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
