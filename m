Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9926510305C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Nov 2019 00:41:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iXD7L-00053L-EF; Tue, 19 Nov 2019 23:41:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bart.vanassche@gmail.com>) id 1iXD7I-000537-OK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Nov 2019 23:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LGdI8nMvJO9Yp2V4F8P1ev7tTWwm2jfSwnW1T5/k5as=; b=Pl0BNalDrX5c0tNYp/YuYUzma5
 lUCzYXRP2s4JVFNdBqO60jZ3gCzL3w+SpGWkFTxqbVdxpzEKBblIeBJbtfMsxl0G4Z/3RCNjcqbkO
 vmXM/oRDlDt9RE5tB1i+tFif+dqs/ltMF3CmlVy6iUVsvoPj7hmitHaMr/ctggc6ndvY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LGdI8nMvJO9Yp2V4F8P1ev7tTWwm2jfSwnW1T5/k5as=; b=iTb5/gydKPAbl3bXPDhmAXtUoe
 mV1Rbx50n/hwxVv54vgYKXtQXVB7yfiHsRWEXL+NGobgcWFqUi0aTlxf2QQgPFu2cE3I6WQYoj6Tw
 LcmTjLSW6nLPEtked0dA0k9Tbct/w5LE/K0tqbbGu0A8m01/heXzlZDUzq0T0agocvss=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iXD7H-006Zpa-Bw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Nov 2019 23:41:04 +0000
Received: by mail-pl1-f196.google.com with SMTP id d7so12851325pls.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Nov 2019 15:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LGdI8nMvJO9Yp2V4F8P1ev7tTWwm2jfSwnW1T5/k5as=;
 b=n+FLwVHxmZmDN3ySNqSpdb1tcQ+jue2uqJdMBJ0s/eH/oMXz+yH6+5oxRk+X7lHy7p
 19YwJfeh6t60ui9XG1zl4cgxlp7uWqMRGaQjz3DOU+3MEqlfmyOx12Tk1aNZADAXHa15
 r4N+71zcpcEXpDwY5M9fK8xFEjc/zqm0Rm2z0Qj9J4zEp8d1bk67emWIdaaF+8Tk8mvZ
 I5o2gzm7Wp0Lh3JPr2fsfFWLmAYaZP8PtuHVMkarCDkF4tDB3CJsT3ssWmc0hPrHO1Tq
 WIFm+WX2bJse8rBuY60k1hxqQbdARm6wxR0Ji4PVQYePh7pySiw/PVHPsxvknDfnM1n2
 O7Bw==
X-Gm-Message-State: APjAAAW/H0Je+EjT3NPpV1vhYgbQiIkYBvhabcdPnYa/EALvhRhs0RPs
 q35sSWJflQkuSLA6fV4DlMsPadfkG1o=
X-Google-Smtp-Source: APXvYqxaqRKCdfDH6V8YoUt6s/ImovXm0GCKDyXavhCF1NO0+J23GblS0JEL8I94w3YrZSAKQMm05Q==
X-Received: by 2002:a17:90a:bd95:: with SMTP id
 z21mr246817pjr.10.1574206857435; 
 Tue, 19 Nov 2019 15:40:57 -0800 (PST)
Received: from desktop-bart.svl.corp.google.com
 ([2620:15c:2cd:202:4308:52a3:24b6:2c60])
 by smtp.gmail.com with ESMTPSA id x192sm29727552pfd.96.2019.11.19.15.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 15:40:56 -0800 (PST)
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190518004751.18962-1-jaegeuk@kernel.org>
 <20190518005304.GA19446@jaegeuk-macbookpro.roam.corp.google.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <1e1aae74-bd6b-dddb-0c88-660aac33872c@acm.org>
Date: Tue, 19 Nov 2019 15:40:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190518005304.GA19446@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (bart.vanassche[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.196 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iXD7H-006Zpa-Bw
Subject: Re: [f2fs-dev] [PATCH v2] loop: avoid EAGAIN,
 if offset or block_size are changed
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/17/19 5:53 PM, Jaegeuk Kim wrote:
> This patch tries to avoid EAGAIN due to nrpages!=0 that was originally trying
> to drop stale pages resulting in wrong data access.
> 
> Report: https://bugs.chromium.org/p/chromium/issues/detail?id=938958#c38

Please provide a more detailed commit description. What is wrong with 
the current implementation and why is the new behavior considered the 
correct behavior?

This patch moves draining code from before the following comment to 
after that comment:

/* I/O need to be drained during transfer transition */

Is that comment still correct or should it perhaps be updated?

Thanks,

Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
