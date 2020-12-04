Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB792CEA82
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 10:11:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kl77g-0001dy-KA; Fri, 04 Dec 2020 09:11:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@redhat.com>) id 1kl77e-0001do-68
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 09:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/N3JWPWSHjuCdyfo7VgFC9Eox7LNMnKOtYh5z7qZpF8=; b=l3lOV/th+m5BG3BwYV6Y0d9USw
 Du997v3OBv8aNyUDEsmZKvrYnXlSF0Mg29mcP9fguYp1BsJoXZPacQstYbS0W/IQjFtwIT6WBBSR/
 komR4Q6I9zQQScjfTTHKTN+KQIEObh/MJCvpC8REpVFZwd2d/MU4iK4ug+Y2H4tvGirY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/N3JWPWSHjuCdyfo7VgFC9Eox7LNMnKOtYh5z7qZpF8=; b=dQqhC9p5LktE2Sp0yLm9co25iR
 RrKtsfOksakVzu4teGvTG6OAfBxsaqYLLQ2f39hJA+ZN5fjSSvU4YnFieu//AVsI5BUjBRMVcM1ob
 cRvYWFYSyp46ADBnaGZAWsHWnLlJxg+8YkvcI3Qmgt/zhExYKhr4sYicgnukExAneVgo=;
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1kl77W-001NBj-Ay
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 09:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607073072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/N3JWPWSHjuCdyfo7VgFC9Eox7LNMnKOtYh5z7qZpF8=;
 b=gcctQfqb8AVkEqNUbD2y8dyh4BUzjUXF6oFAtVQkiPeFdD26h5J4BBA/NRGuRd3C4wwFtz
 rkXGxi+Lmb1GDX+3yWzREhEI6bplJt6bSsvDNg770yiOntbNzE4agQ3l0HNTxRkI2SAuGt
 0rM5hTAappZkAfk5+Dd4PuC+cmVz2oI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-1ZYdFXghM5qNb8B2gFVLRA-1; Fri, 04 Dec 2020 04:11:09 -0500
X-MC-Unique: 1ZYdFXghM5qNb8B2gFVLRA-1
Received: by mail-pl1-f197.google.com with SMTP id y10so1305525pll.20
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Dec 2020 01:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/N3JWPWSHjuCdyfo7VgFC9Eox7LNMnKOtYh5z7qZpF8=;
 b=THW+3LPsaL3gGVP/LIW9eYSG8trE06yVRslXRTmJCIi3Br2DgOfufsqsvhRZnREXoa
 ePh9u8XteLUoURA9vkeZbsw16dBmm1q7TSz8jLRzggkJmCt5OHNVOUuyztGV13nO6XgF
 lvEZjJ4a5HduJqbEE4MPmXJpjwvCspf/sLDFKWR0a1/L0QH11yi/1ctOe3y4Yc0Lyvw9
 1W2tMtzw/cGYB5zcwKnaImgGiZXpI/VoWQGtUCtYEs5xINC0vD+5BVFiUnPgFSS8nLBO
 LlJv81PSqdakb56UMFKuJs2WwGuJcic2qxXX3QheY+VxZrCW0LyCxVZ4OJZVmKO6IFt6
 nfIA==
X-Gm-Message-State: AOAM532hmnjXSjQP7Jya70b3wTF0C2VyxRVVRpiHA67uZZQnPyhNGGEj
 tmQGPwjcTmOo4VYlU1EdobTVtArh20J+0h6zLoJHLdpRErEPIL0qtdCTBxhg+eFZ+P7/gAYLI3w
 NNrviAGQu+etHudELPkFn+sQQTMDWxltCk2k4gA==
X-Received: by 2002:a17:90a:6809:: with SMTP id
 p9mr3167717pjj.112.1607073068607; 
 Fri, 04 Dec 2020 01:11:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw16vfZeKJPsf0lfqYW/K1sVXF785ufO1lPzqaoNbytT0nbs3JfJy5TYdw8Iv3Jkdo/aUYr9w==
X-Received: by 2002:a17:90a:6809:: with SMTP id
 p9mr3167694pjj.112.1607073068374; 
 Fri, 04 Dec 2020 01:11:08 -0800 (PST)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b24sm1582460pjq.10.2020.12.04.01.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 01:11:08 -0800 (PST)
Date: Fri, 4 Dec 2020 17:10:57 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201204091057.GB2025226@xiangao.remote.csb>
References: <20201203061715.60447-1-yuchao0@huawei.com>
 <X8k9UoUKcyThlJNU@gmail.com>
 <20201204003119.GA1957051@xiangao.remote.csb>
 <d713f69b-af1b-4e4a-41ad-267a3b9026ac@huawei.com>
 <20201204074323.GA2025226@xiangao.remote.csb>
 <ffca7f07-653f-1270-72d4-e66ffc8a7473@huawei.com>
MIME-Version: 1.0
In-Reply-To: <ffca7f07-653f-1270-72d4-e66ffc8a7473@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [63.128.21.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [63.128.21.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kl77W-001NBj-Ay
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

On Fri, Dec 04, 2020 at 04:50:14PM +0800, Chao Yu wrote:

...

> 
> > 
> > About the speed, I think which is also limited to storage device and other
> > conditions (I mean the CPU loading during the writeback might be different
> > between lz4 and lz4hc-9 due to many other bounds, e.g. UFS 3.0 seq
> > write is somewhat higher vs VM. lz4 may have higher bandwidth on high
> 
> Yeah, I guess my VM have been limited on its storage bandwidth, and its back-end
> could be low-end rotating disk...

Yeah, anyway that's in IO writeback path (no matter the time was working
on IO or CPU calcualation...)

> 
> > level devices since it seems some IO bound here... I guess but not sure,
> > since pure in-memory lz4 is fast according to lzbench / lz4 homepage.)
> > 
> > Anyway, it's up to f2fs folks if it's useful :) (the CR number is what
> > I expect though... I'm a bit of afraid the CPU runtime loading.)
> 
> I just have a glance at CPU usage numbers (my VM has 16 cores):
> lz4hc takes 11% in first half and downgrade to 6% at second half.
> lz4 takes 6% in whole process.
> 
> But that's not accruate...

There is some userspace lzbench [1] to benchmark lz4/lz4hc completely
in memory. So it's expected that lz4bench will consume all 100% CPU
with maximum bandwidth (but in-kernel lz4 version is lower though):

Intel Core i7-8700K
                Compression     Decompression   C/R
memcpy          10362 MB/s      10790 MB/s      100.00
lz4 1.9.2       737 MB/s        4448 MB/s       47.60
lz4hc 1.9.2 -9  33 MB/s         4378 MB/s       36.75

So adding more IO time (due to storage device difference) could make
CPU loading lower (also could make the whole process IO bound) but
the overall write bandwidth will be lower as well.

[1] https://github.com/inikep/lzbench

Thanks,
Gao Xiang

> 
> Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
