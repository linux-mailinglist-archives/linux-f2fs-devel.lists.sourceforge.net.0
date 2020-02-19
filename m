Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A60B2164F61
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 20:58:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4VUm-0002DD-7h; Wed, 19 Feb 2020 19:58:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <andrew.p.norrie@gmail.com>) id 1j4VUk-0002Cv-JG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 19:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EE2YczNla8qcSD1v8Yhtpjh81Hi8Cqph0O/BaPLbCAQ=; b=TH/SEdJiM05SmHUuYrvlnOBSlj
 +dVIoVNdWV6obhjfLaADo4q/Rq3IjNJ4buj+QNOvSxGR7HD/CUEN3P7nL8FJJ/niRjPU9RttqnKHI
 VlsSXhkwm92y/10wy+/U8cYuQ277JW1r+iPD425LQK+pyyjHYFwuljnltGtIgmrMKyJg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EE2YczNla8qcSD1v8Yhtpjh81Hi8Cqph0O/BaPLbCAQ=; b=FuiOMFbuQq440pEjL6YrGIvLdn
 YZwjljuX4vnnkMNyOot1o1rFyWwEBYtKhI/BApRQbxhQt+WZr0gt3ph21kDD9h50fmRfINdRl5KTs
 i13poU9mb2dfGOrR/ZxWouzN9kURCYIL3ojc+9puRyKpY8aazCliCtaMk5H8c+5DwRuk=;
Received: from mail-qv1-f66.google.com ([209.85.219.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j4VUi-008QV0-KJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 19:58:54 +0000
Received: by mail-qv1-f66.google.com with SMTP id ff2so777273qvb.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 19 Feb 2020 11:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EE2YczNla8qcSD1v8Yhtpjh81Hi8Cqph0O/BaPLbCAQ=;
 b=G1xtQrA+Fl4T+NuvpjF24JE+In7qYLxIVbRiQPkhWMC1ygQS53vX7qgTSJMWTK1yAo
 Fnxy/LLZlO9YMHyqOehXXfantuBgsWk1g8kgrvnXyuidsDUdQsLyt1rTnOGIQwyLGuIU
 HGm7wU+lOgUaYtDAA5xrONZf4U02774D8cZPxqI2iptCYE32M4ji1gZOfi2bgXgdYCBm
 49/aFU3pEkkgxZlJBuLQR2S3S5uyUNHBH6Y8l7sc8MzEiiEgATMsMsbvswFymESb6z2f
 imR7csI3tgyJvoX49ybjwQDkDLW7BbsVmnemJTSEBOwtr8wfDCBflEPziuqtohqxBBCk
 3EGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EE2YczNla8qcSD1v8Yhtpjh81Hi8Cqph0O/BaPLbCAQ=;
 b=EZNK/uldETgkdsKeF/UW36RcllMOn/6ElmeTlZT6gMMclMobfDvstltAispr7EsIdz
 dNZ+Ljdax/wFG4QtOjVMDf5ryjX2xu5b/SK4gpO3brQrcSUBbTarMFWk8mS91ODYYqVG
 O9TDAV4EhWlwVhe3UzAjpVcg5pWKC6y1VhgzRbVpH3H+52Amvw/TYoj2IHoTio5bwY7f
 JQkOqVK+vVkqmz/WNZwaDMJ5PpxO7uMKx6/cda2zF/4NKK27Lrom6Ntu+qNEGpOmQMA3
 9iGa22e8/dfnBpGboVOpBeMiuJByD3MiRTpfqiFGV/a5JEK2rHf0L7tEBuM4Ai0+gvQO
 VrNg==
X-Gm-Message-State: APjAAAX7hKYbX0mq2kUgPLDpK4EDARzuH5Ya+lFQsm4n/tedw7HTRzXE
 VhhCJBYbVa5LC0sWEnHxDYc=
X-Google-Smtp-Source: APXvYqxzp/p/uQ5OKuQzlRYvxU23dKiBTzDJThNZdRcJUJajNV++tcWXBL5KzKBvpWKSUDJ/qbow+A==
X-Received: by 2002:a0c:f24a:: with SMTP id z10mr22861156qvl.33.1582142326588; 
 Wed, 19 Feb 2020 11:58:46 -0800 (PST)
Received: from andrew4.ggf2gnjfztzulbq0d1gogf4ope.bx.internal.cloudapp.net
 ([52.224.106.77])
 by smtp.gmail.com with ESMTPSA id j28sm368751qki.61.2020.02.19.11.58.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 19 Feb 2020 11:58:46 -0800 (PST)
From: Andrew Norrie <andrew.p.norrie@gmail.com>
X-Google-Original-From: Andrew Norrie <andrew.norrie@cgg.com>
To: bvanassche@acm.org
Date: Wed, 19 Feb 2020 19:58:45 +0000
Message-Id: <1582142325-40880-1-git-send-email-andrew.norrie@cgg.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <898950e4-3759-c78e-dd5d-422af9f8c507@acm.org>
References: <898950e4-3759-c78e-dd5d-422af9f8c507@acm.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (andrew.p.norrie[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1j4VUi-008QV0-KJ
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
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 jaegeuk@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Just checking again the status of this patch?
It doesn't look like it's made it into the kernel yet?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
