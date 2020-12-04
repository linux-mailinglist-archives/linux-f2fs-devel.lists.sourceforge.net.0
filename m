Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BABD22CE71E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 05:51:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kl342-00006W-BE; Fri, 04 Dec 2020 04:51:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers3@gmail.com>) id 1kl33y-000064-Kv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 04:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FNuE5GFHoDJ2lKhdztnB9ycEKhCes0TVFJagK8diM14=; b=eRgOiI5VyJ5JfWRSddDszg+uGd
 FVk49xl7jqgkhrZKAENdehs27UIFvNJ15IddckCFVTkq+XGii9RH3WPLBZ5xjbCbzXYkKxtdUJgBx
 D1vWRbuFDzMRb+/41Xjj4rD8hi8HNG1uy+n8VM2CJoBa7miL6u+kElQYm7kQTptlJNeg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FNuE5GFHoDJ2lKhdztnB9ycEKhCes0TVFJagK8diM14=; b=G70hfsSmIWFegLpSXv9jgymgSE
 Ww/p9AVWg7suV2wvD6G1i5v5beoC4EPMBhWmQ0ExGH1vEZDUV3UsE2YlLeO/QIVXdjicDJrdiA/GD
 iT+rxh4ehKLIYN8TB/SwLjMORrPWLMgR3DziYW9htBTlCOyRUv8h7H4PlSBUvwlwX0M4=;
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kl33t-00ESSC-Ml
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 04:51:22 +0000
Received: by mail-oi1-f196.google.com with SMTP id l207so1956277oib.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Dec 2020 20:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FNuE5GFHoDJ2lKhdztnB9ycEKhCes0TVFJagK8diM14=;
 b=lDndcSOtHAV3kBy3uG6eeqdAiGPxdfj64vknrgN3TtuWM3oE2pmwMFCdIZvKkv5Se2
 M0P4Gp5dWCEByP54ebPqQFdAKRRkpRELnH3bQrZB2kfsBn5RSDoNhUfXVSlxnOpZNMmX
 wxWwOFJe3sXc3lefWwbNC5qLrcFLrZWMUCMkcNHPt3q2fVthBtrC9ZKMOkWVnZqdx0Wc
 fXn1bmNqmq8ngGNue2GgsldWwIJ/PbE36bGzKyq6S1qtBUuz0qg4O9qBsTzRc43flOVn
 Een4ceTb7MfEz3zYmYKF3aFmHs78MY4PMuwutwJZ/YBPtlYQuqT5hU2HyRCnSoMhCPjv
 lJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FNuE5GFHoDJ2lKhdztnB9ycEKhCes0TVFJagK8diM14=;
 b=Ze+QpBoG52iPPtuAW7hAkHAF78iP68fe9ijuX5ZhE3FgRiycO65CJLnkpT+L23vymK
 vIF88CGPmyrs+1m5KaGtQxh+bsQ3jovnt3sjwZHMGZ15STOijFOn+5P8JRWbEg4lJw2f
 sbtGN5in2QPf1QVYpGpmzDOrYVmFP0TYvIuWIJwFghVDvR3dwjM4y/cDLtNHRgy4r8w6
 HQSkKU69FqqX56Nw5MZgjhnQ1bFgywbq6D6gArxO49LuM80J8CZt6blibNQOwF9bBiSs
 GqWzQlaTIDjmWTk3QcXo6hs3CzqvucfLMzCipfCmuaPMT6eD9gocHHglBf8eF4uO+Um7
 FFrg==
X-Gm-Message-State: AOAM530KJiXxxVB9UpDZC0aH1jBMlEgj3r5/XdSNZlLchA0iK1oTvYjV
 PaTzsa2J+mmh4W85LKv0gsQ=
X-Google-Smtp-Source: ABdhPJxxdSPPj0YfQLcfpBWwOgOaIwKcJYh5K0ALCh+dlw8UrGVaUcfroAniGJGZrrSufnmMqOWd8w==
X-Received: by 2002:aca:3589:: with SMTP id c131mr1910712oia.57.1607057472203; 
 Thu, 03 Dec 2020 20:51:12 -0800 (PST)
Received: from sol.localdomain
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net. [172.10.235.113])
 by smtp.gmail.com with ESMTPSA id e8sm391823oti.76.2020.12.03.20.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 20:51:11 -0800 (PST)
Date: Thu, 3 Dec 2020 20:51:09 -0800
From: Eric Biggers <ebiggers3@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <X8nAParf9GW9LaGV@sol.localdomain>
References: <20201204005847.654074-1-daeho43@gmail.com>
 <X8msy1T8uqZ4Z/iR@sol.localdomain>
 <CACOAw_wTFsfgLfrWKRoM1o_HQorJE-=2ztZftQTn+comcpmHxQ@mail.gmail.com>
 <X8m0qbd7rvQyiwOt@sol.localdomain>
 <CACOAw_y2HRE8CDk-HAjA6w_HzGJpRpivPY5zKRMC4_SNYTnTGg@mail.gmail.com>
 <CACOAw_xzKjZcpVTo3aj5sJUQ_BjLr=5ZhnfuyFwYerpyzZu+aw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_xzKjZcpVTo3aj5sJUQ_BjLr=5ZhnfuyFwYerpyzZu+aw@mail.gmail.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (ebiggers3[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (ebiggers3[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kl33t-00ESSC-Ml
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix race of pending_pages in
 decompression
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 04, 2020 at 01:48:24PM +0900, Daeho Jeong wrote:
> Eric,
> 
> I have another question.
> I understand enabling the verity can be possible in the middle of I/O.
> Is the opposite way also possible? Actually, I couldn't find any
> disabling function of it, though.
> 

No, disabling fs-verity on a file isn't possible.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
