Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B328D5404A1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jun 2022 19:18:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nycq9-0008D1-Mm; Tue, 07 Jun 2022 17:18:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <konishi.ryusuke@gmail.com>) id 1nycq8-0008Cf-MU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jun 2022 17:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Gf/LMdzQibmA3CQFIu++5apIgfZQUBK5B+qLCJdcj4=; b=Nf77TXhHXVA1+hTmaLSS+DQkrR
 2l4BHxI0/urhwKdbezSr6GGvtd1rQ7ZDdBIfzU6C8g22Xj7zVu6WEfZ247EJMtXSfXmwmxZHLTNEL
 LbwU8xZa6CuDq/BeewenpPH/xgGNNNxFKGTeepQJ7a6Usl1a7I+lCSpPNGSZhMOvEmPs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2Gf/LMdzQibmA3CQFIu++5apIgfZQUBK5B+qLCJdcj4=; b=aEYd6Ai3nnTb46DnRe1Lytzzb0
 a6TcNH6iLqutID/sz5E9TebRpA3m89mingfrwPIFE3IwO0R7JcMWBfpSQUC+WQq1yArBnx6VtNW9U
 P4jlJwg/CowOziZN9Q6T6Y5XHqvZCrqrmayIIW++XmqT1p5wva1D08MIz4I/lz5p/sDo=;
Received: from mail-yb1-f174.google.com ([209.85.219.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nycq6-008S64-TG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jun 2022 17:18:00 +0000
Received: by mail-yb1-f174.google.com with SMTP id i39so4199098ybj.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Jun 2022 10:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Gf/LMdzQibmA3CQFIu++5apIgfZQUBK5B+qLCJdcj4=;
 b=UlIOhhRMP5WcJQ/zc/OiuB+lJTkLdYOOC2sp32tUMTA/O3i/rkc1ZAr+Jnb1VYWskV
 u05p+kDGel0dChhHcNMQJ3nWK9QM/AusSmrLoilAGAMq8P1Cg/bOJoeexeiBsy2GTk2F
 xVz0A6K871QbrFfNY0huAGfUWcdkRyXdofetnbhEzKFP4IxOMyQ0BEUlVV/2c2qB5QcA
 555PBTn0EZRhixi/yvufl6vbsxbyCY9hXpoiDGn8etsqPoI/JAhbz7JMw04rLSzr9ZHj
 Urd+yKShZEUZEf3WOAkzCDqqZ597u7goZccNJETiU8vkNdpHhHzGB9Qr5r5SMSwm00qh
 DfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Gf/LMdzQibmA3CQFIu++5apIgfZQUBK5B+qLCJdcj4=;
 b=m5neOeUBThPn/09LyWD1JqtXUnPucnywwMiq27AWCEJ0NS5L2SRV739oiBLeUVhQv8
 I5ZO4ducn55dVBmtRE5YUotfT8VoMENh9LKWajm8VdLNgz6lT6WNGaeTPkjqDiYYYQsH
 03FoMkBkt8AwUwfGyGOGrLCyH6QudvSfevRaQO2qB4VJzfXgiHQzyqXOCyH+3qn4WJNt
 IvTfrSiqqlYWMGH9TKpUq7xyD3YsKs08aTc7KC83Cd9BXuLk2FQZ5R3RC9mFa0Q398U6
 RZH5jjNAa3odT9q8TvZai/BKdKi3rcO+7CS5xdG+L+XrlJ7SgHddp/nizjsIomXd0/+0
 SWMA==
X-Gm-Message-State: AOAM53394+lwSdjefN7lqstHaHf5I14A4r9WjY0T62uxfzhM/xM/gYhi
 rx+sg8SZk9rfuS+8WMHPzCpXMfR4irL86ejBNTPKl7Kf
X-Google-Smtp-Source: ABdhPJynkdTX/fp35vm2swA2RdeGUwkUNt87eYdVaLp+FtHRWgq9QR33twmE++ce1Xf4CBz4Rw1N2NcwHcYZ321gzr0=
X-Received: by 2002:a05:6902:1509:b0:663:3a8b:4fac with SMTP id
 q9-20020a056902150900b006633a8b4facmr18522009ybu.545.1654618264815; Tue, 07
 Jun 2022 09:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220605193854.2371230-1-willy@infradead.org>
 <20220605193854.2371230-8-willy@infradead.org>
In-Reply-To: <20220605193854.2371230-8-willy@infradead.org>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Wed, 8 Jun 2022 01:10:53 +0900
Message-ID: <CAKFNMonLF+nEs7xi0t=Wy4tf7fttLZCL4v+AZGjDWvSYqmZiaw@mail.gmail.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 6, 2022 at 1:00 PM Matthew Wilcox (Oracle) wrote:
 > > Use folios throughout. > > Signed-off-by: Matthew Wilcox (Oracle) > ---
 > fs/nilfs2/page.c | 60 ++++++++++++++++++++++++ [...] 
 Content analysis details:   (2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.174 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [konishi.ryusuke[at]gmail.com]
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.174 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nycq6-008S64-TG
Subject: Re: [f2fs-dev] [PATCH 07/10] nilfs2: Convert
 nilfs_copy_back_pages() to use filemap_get_folios()
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
Cc: linux-nilfs <linux-nilfs@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Linux MM <linux-mm@kvack.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 6, 2022 at 1:00 PM Matthew Wilcox (Oracle) wrote:
>
> Use folios throughout.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/nilfs2/page.c | 60 ++++++++++++++++++++++++------------------------
>  1 file changed, 30 insertions(+), 30 deletions(-)

Throughout, looks good to me.   Thank you so much for your great work.

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Ryusuke Konishi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
