Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DA21E9F03
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jun 2020 09:22:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jfem5-00030A-Q4; Mon, 01 Jun 2020 07:22:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pilgrimtao@gmail.com>) id 1jfem4-0002zy-0G
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 07:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LIgRN0QDBu4gnSn3TisqfMx5xMC/fpgZPP0eL7TYZo4=; b=hzVD3bgJ/huz5H3IpyrLNd6Nnl
 QijTHd/AQBbC/plSlkhZJd86wvW+K2MPBdM12/cvReR7WQApvHimCPU6xPCtG7Od5PxkJhwOyVcCv
 vm+tpV5aqwHrL1F9X2kLo/+C7gigpFprBoaJCM4uccXZoevprtlRegvVv2NiJ6HCZO6o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LIgRN0QDBu4gnSn3TisqfMx5xMC/fpgZPP0eL7TYZo4=; b=Rcc6HS3J5otyeI6cCpdB85MqKL
 iZy4Jb0yBvjWGNwteuXFkMX4LMuOf8Brqgsin5QOszhecRyOG0LKkDtURo8iufUG9fYGzR2DqVywI
 GAWk5LHXwwWP/IuUOzUJsSTEqPDNczX3Ef8tHlQr/l6N6RWl1OD8racm+GTJhpMH81hk=;
Received: from mail-vs1-f65.google.com ([209.85.217.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jfem2-003DVL-Kv
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 07:22:19 +0000
Received: by mail-vs1-f65.google.com with SMTP id u7so5059196vsp.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Jun 2020 00:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LIgRN0QDBu4gnSn3TisqfMx5xMC/fpgZPP0eL7TYZo4=;
 b=Qy+GRsFwP59gROSPpwcSk+d4BmBdCEdjxVcnG89ETwVbaChC3CZGqNCjYA5q3zZEXV
 ftJjSX22++JyxqShjPrcs60ExBRV9rkg0po2DVvCYUGUQ+/Lln9ssEhgcKVqibq5h1QD
 3GcB+VR5pmjymE7fc4kCi6UuBXGedcxGeKYY0JahfpNnaRtzua+jlXVyuPKz5eq95nyx
 FH5rsmTOlXiADyitE7Yo9XplyqzAHQ1AspJB0cypzPPGDXANPkzbpULgcPelQMQlpYkn
 q2rtZDeeH2pm1YHT1QiK+n+u+A7jM83OUkEtSD+uInIdVHUsPiVFys6kxdjnMNKzkX37
 ++ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LIgRN0QDBu4gnSn3TisqfMx5xMC/fpgZPP0eL7TYZo4=;
 b=cbaPvrg1FbcjTJpEeQxxKL5muJHrhd1g17Gc1EN9HS2r2oc2KltxHn345I+I63DTxj
 8MvdCdJvcrIurePtikdvSy6PMh5Bje65SLFjXS91smwBFTVrqr36kquDXGVALiocrS1v
 jMBBqUqCAJNdVX7Msq5AuZu/LmngsIKYG3Fvv0NGruODRvL3O0wzL3zeqfS4FIUnHAQJ
 KargO/+ur8SzNz4T+jFJwGz5UHYycIyCd3A8g1V4Xvsx+/pircTvUbDJhdQ4TYK61zma
 4yeMzpZFvyORY8DhjDY43heNkRjU1SaDXR63TUunSImFrP1gi0UexfB0fETap0rtoF1C
 q2Zw==
X-Gm-Message-State: AOAM530jPuMSveRTkzr+PitotpyiouUeTz350PaNEcdDKvVNV0FC0Mfb
 /rvYz5Z0/u6dGUR5yN05MmRbiYaR+CdXUlZYkCY=
X-Google-Smtp-Source: ABdhPJzIA1FGKrVz+9UgvnCvE4qHbM8WwKnt0yzT0Ej9MwEf3XXL3bZ9GG5bYf4/kar44nR6s2ZBVVKbKsVOWbpBIWw=
X-Received: by 2002:a05:6102:a17:: with SMTP id
 t23mr9115865vsa.62.1590996132886; 
 Mon, 01 Jun 2020 00:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200529141100.37519-1-pilgrimtao@gmail.com>
 <c8412d98-0328-0976-e5f9-5beddc148a35@kernel.dk>
In-Reply-To: <c8412d98-0328-0976-e5f9-5beddc148a35@kernel.dk>
From: Tao pilgrim <pilgrimtao@gmail.com>
Date: Mon, 1 Jun 2020 15:22:01 +0800
Message-ID: <CAAWJmAZOQQQeNiTr48OSRRdO2pG+q4c=6gjT55CkWC5FN=HXmA@mail.gmail.com>
To: Jens Axboe <axboe@kernel.dk>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (pilgrimtao[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.65 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: kernel.dk]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jfem2-003DVL-Kv
Subject: Re: [f2fs-dev] [PATCH v2] blkdev: Replace blksize_bits() with
 ilog2()
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
Cc: hoeppner@linux.ibm.com, heiko.carstens@de.ibm.com,
 linux-nvme@lists.infradead.org, dhowells@redhat.com, clm@fb.com,
 deepa.kernel@gmail.com, houtao1@huawei.com, hch@lst.de,
 linux-s390@vger.kernel.org, bvanassche@acm.org, darrick.wong@oracle.com,
 Mark Fasheh <mark@fasheh.com>, satyat@google.com, hch@infradead.org,
 borntraeger@de.ibm.com, gor@linux.ibm.com, chaitanya.kulkarni@wdc.com,
 Josef Bacik <josef@toxicpanda.com>, ming.lei@redhat.com,
 viro@zeniv.linux.org.uk, Muchun Song <songmuchun@bytedance.com>,
 dsterba@suse.com, jaegeuk@kernel.org, jlbec@evilplan.org, sagi@grimberg.me,
 balbi@kernel.org, damien.lemoal@wdc.com, martin.petersen@oracle.com,
 joseph.qi@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 asml.silence@gmail.com, linux-btrfs@vger.kernel.org, sth@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 29, 2020 at 10:13 PM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 5/29/20 8:11 AM, Kaitao Cheng wrote:
> > There is a function named ilog2() exist which can replace blksize.
> > The generated code will be shorter and more efficient on some
> > architecture, such as arm64. And ilog2() can be optimized according
> > to different architecture.
>
> When you posted this last time, I said:
>
> "I like the simplification, but do you have any results to back up
>  that claim? Is the generated code shorter? Runs faster?"
>

Hi  Jens Axboe:

I did a test on ARM64.
unsigned int ckt_blksize(int size)
{
   return blksize_bits(size);
}
unsigned int ckt_ilog2(int size)
{
    return ilog2(size);
}

When I compiled it into assembly code, I got the following result,

0000000000000088 <ckt_blksize>:
      88: 2a0003e8 mov w8, w0
      8c: 321d03e0 orr w0, wzr, #0x8
      90: 11000400 add w0, w0, #0x1
      94: 7108051f cmp w8, #0x201
      98: 53017d08 lsr w8, w8, #1
      9c: 54ffffa8 b.hi 90 <ckt_blksize+0x8>
      a0: d65f03c0 ret
      a4: d503201f nop

00000000000000a8 <ckt_ilog2>:
      a8: 320013e8 orr w8, wzr, #0x1f
      ac: 5ac01009 clz w9, w0
      b0: 4b090108 sub w8, w8, w9
      b4: 7100001f cmp w0, #0x0
      b8: 5a9f1100 csinv w0, w8, wzr, ne
      bc: d65f03c0 ret

The generated code of ilog2  is shorter , and  runs faster


> which you handily ignored, yet sending out a new version. I'm not
> going to apply this without justification, your commit message is
> handwavy at best.
>

Do I need to write the test content into commit message?



-- 
Yours,
Kaitao Cheng


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
