Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6222B10B632
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Nov 2019 19:55:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ia2Sj-00048u-MH; Wed, 27 Nov 2019 18:54:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bart.vanassche@gmail.com>) id 1ia2Si-00048n-Nf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Nov 2019 18:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iNMKV6JKx16eJZPWeMfLiRiiW9bu99KddtEjmyG/dBw=; b=f3Y7b9SmcfKyzhqUQkc/r1r9Ue
 5say+S3lUZuDFCjKv/Nxobf4qkJbBgIXpZ9gVyXACXfovfE+tk+YUZ8echy6jee1idXRSo5t55fwA
 34svZmT3hbhRZNQfmF3tX79MiDrd43zK8ckwpaAvUp/TsBy+B7DrdCkwZlig9xgroWOs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iNMKV6JKx16eJZPWeMfLiRiiW9bu99KddtEjmyG/dBw=; b=ZfNpCY1f+m+GTX8k0VwSzw4Tq0
 GlbTthJi0XNwwr3hQoNmPf1uJhR+IL0D6jGL0/TMf1XKTF/mfaLm2v3qhBRdEAlli+OIvKuPiGc2O
 MRVjezdz14h9Q6fQ+0Ahci767kMUKy/xPIvJVG2rQHQM6d3DU7YjyykVh5yN8Af8C7e4=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ia2Se-00FQ6l-TA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Nov 2019 18:54:53 +0000
Received: by mail-pg1-f196.google.com with SMTP id k13so11363538pgh.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Nov 2019 10:54:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iNMKV6JKx16eJZPWeMfLiRiiW9bu99KddtEjmyG/dBw=;
 b=FLfRC6Dmc50vuJMnZq4pe+rmPdxvPaeND0xJ5yEPHHVJn0+fnOTZcPmYY5LPfkeNEj
 7txd2wZqrqM/tH9MgOwoh+P00qgfcviG0vicGk2pt7AEoH5sJo4DYFqM2RNaWrNR8cHQ
 1F3BI6N/rzNHiwkG3ttR1WDyqIO13cDn0C6SE3LAs+OoMETbwM2k2WiSZRcW1JKp6RqU
 OCaiPc0/Wf8DFycCmgiq3XnoRKMsvqr7TSTDbin+dLDecs3Vb7ixJgGY09YT0J3nbM0s
 L6ikimNkJaco6rlIq0TBpyWFNfnhBONNZOZMhQ6I2e4k7R/q9ye1WtIBzFaMu7bNOOrO
 xyqw==
X-Gm-Message-State: APjAAAV9MYgJLR01PF0EIgcS5ohvD4W19L3iU5a0PCH5i8tZt6LzeEfj
 k9ynfV7a3iSkKVcB39UYUz4=
X-Google-Smtp-Source: APXvYqwM60udEdRU61xo0iuYVsNDZqo6TRXXgKHNgiD1W7HWHYnqXvx+mPjwp9lBn9tcojds7pkzhw==
X-Received: by 2002:a63:447:: with SMTP id 68mr6357827pge.364.1574880882964;
 Wed, 27 Nov 2019 10:54:42 -0800 (PST)
Received: from desktop-bart.svl.corp.google.com
 ([2620:15c:2cd:202:4308:52a3:24b6:2c60])
 by smtp.gmail.com with ESMTPSA id j7sm3831350pgn.0.2019.11.27.10.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 10:54:41 -0800 (PST)
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190518004751.18962-1-jaegeuk@kernel.org>
 <20190518005304.GA19446@jaegeuk-macbookpro.roam.corp.google.com>
 <20191127181809.GA42245@jaegeuk-macbookpro.roam.corp.google.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <898950e4-3759-c78e-dd5d-422af9f8c507@acm.org>
Date: Wed, 27 Nov 2019 10:54:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127181809.GA42245@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (bart.vanassche[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: acm.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ia2Se-00FQ6l-TA
Subject: Re: [f2fs-dev] [PATCH v3] loop: avoid EAGAIN,
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

On 11/27/19 10:18 AM, Jaegeuk Kim wrote:
> Previously, there was a bug where user could see stale buffer cache (e.g, 512B)
> attached in the 4KB-sized pager cache, when the block size was changed from
> 512B to 4KB. That was fixed by:
> commit 5db470e229e2 ("loop: drop caches if offset or block_size are changed")

[ ... ]

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
