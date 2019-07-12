Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0936728A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2019 17:36:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlxbG-0005Av-4x; Fri, 12 Jul 2019 15:36:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <axboe@kernel.dk>) id 1hlxbF-0005Ac-Gf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 15:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TgV+P5xUNL5epV/ZpLeslnEZ8CdbgVF9nNrx/k03o8g=; b=SsNPRcabZRsXlcUxaW2G8i+USI
 OqeEswterVkI+55V0W0WpFy2z8PmnQpfJAeWJ464iuSs8pYv8m/Z3DqdIFa7HjnSz+dwxKhtqxvYW
 tLcIByGqNfdeGf/gnlteOQTWj5OCosJ8L5jzchy1uqeytZd2/9dIw8Y9gZcVAtu3cRvw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TgV+P5xUNL5epV/ZpLeslnEZ8CdbgVF9nNrx/k03o8g=; b=l9KNY1LH0HTkX6k8hk9Kbm88Qf
 FDJYPlLgxpjx1NnQSk/sZ8B64i/oaNDOFdTHu1L/T6xAk1Mo27mWznaW6rcoTe2ApBQDDKQEySG7S
 3/WF+jkztlwaMsx9Q3l0I/YQN4wRBiNmx4Kx+5qdsbr1iJGalouYxt9UKgpVrzLAw2lo=;
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hlxbD-00H5ez-CT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 15:36:41 +0000
Received: by mail-io1-f65.google.com with SMTP id s7so21148436iob.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jul 2019 08:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TgV+P5xUNL5epV/ZpLeslnEZ8CdbgVF9nNrx/k03o8g=;
 b=CGNvk4/dqGZ6+i1O+wfwJKZoo7ZYVaVuFsXwbqWoKa2XITkHd3rk7eN+9PMEwi0ihT
 l0BWkPExicPNlcfnNhprd86+MADEO/JMKNcrEfFYDcy4UtSlyJGgqGti1tMF6ZQp1Pw7
 PgB5kmZlAOgYnnICnXaE4Ce6bjaK0DqQ1LgWCGLeCGYaGSWtlukgKp30GZNQ0H4JqKou
 Bhzr1mlWRh38YS94B8YBVD967PLS6In5oR2rO4WHBu5RroQ4ZqfcdoRTxKZGAbtzyhwH
 JSlZc1isR6qSYuSho0mHJeLajd0JRjwkmewOWFe26AkCy+6Kjq6/vqcAg+wTP3Y8clDE
 OwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TgV+P5xUNL5epV/ZpLeslnEZ8CdbgVF9nNrx/k03o8g=;
 b=R9TF+xtTb9kPIZJvPS+emM3QJuSOXPb3Lb3bmgsjOvr0ltI79d1ydOcMySeN+UM/ZB
 ULFHcpxhPI+JJoXQ4d/CPP8YRb146D0niFY04feDPEGepvLnWzyOIwr0HZ0Xx0PdED3z
 KzeQ3neYXGrLtlKqzd8RVijK/PYFj/hlNk294ohhbGVDPRsGLvaT6M9uCASkb8//BztU
 XUTzBHzboZ2vYqbg8PrGCSXK0bixC5PZ4VZhVX6ZgchqI3/Y0XLt+RYWoP15YihdsFJ3
 P3702cqWn6vb2IByaH2fMlR/tHYPagAT7oZ3UT6ufIg5AN98r5zPNWPL+hVXyGN1qbbx
 tG2g==
X-Gm-Message-State: APjAAAW/ZIFaH3WMYvHee9JPeApMZpYhg6KxE45+XdI2ZtnGD3UFS3xQ
 y+B7mb8v5yQzs6h8qMRrf2cohIvPVWA=
X-Google-Smtp-Source: APXvYqzNOs4ktys5P/q5Zi/E8ueb3gbQD/m0JLYFVa+rUUweNFsMDDkgPqUBftGoeg2lyKpUDsUArg==
X-Received: by 2002:a5d:8c81:: with SMTP id g1mr11632533ion.239.1562944377622; 
 Fri, 12 Jul 2019 08:12:57 -0700 (PDT)
Received: from [192.168.1.158] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id l5sm15960501ioq.83.2019.07.12.08.12.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 08:12:56 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 Mike Snitzer <snitzer@redhat.com>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
 <BYAPR04MB5816BC7EC358F5785AEE1EA9E7F60@BYAPR04MB5816.namprd04.prod.outlook.com>
 <cb26f686-ce7e-9d1a-4735-2375d65c0ea5@kernel.dk>
Message-ID: <27386e10-7494-7fcf-f203-484db5c3c69c@kernel.dk>
Date: Fri, 12 Jul 2019 09:12:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <cb26f686-ce7e-9d1a-4735-2375d65c0ea5@kernel.dk>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: kernel.dk]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hlxbD-00H5ez-CT
Subject: Re: [f2fs-dev] [PATCH V6 0/4] Fix zone revalidation memory
 allocation failures
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
Cc: Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/11/19 8:05 PM, Jens Axboe wrote:
> On 7/7/19 8:02 PM, Damien Le Moal wrote:
>> On 2019/07/01 14:09, Damien Le Moal wrote:
>>> This series addresses a recuring problem with zone revalidation
>>> failures observed during extensive testing with memory constrained
>>> system and device hot-plugging.
>>
>> Jens, Martin,
>>
>> Any comment regarding this series ?
> 
> LGTM, I'll queue it up for this release.

This broke !CONFIG_BLK_DEV_ZONED builds for null_blk, btw. Please be
sure to test with zoned enabled and disabled in your builds when
changing things that affect both.

I fixed it up:

http://git.kernel.dk/cgit/linux-block/commit/?h=for-linus&id=e347946439ed70e3af0d0c330b36d5648e71727b

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
