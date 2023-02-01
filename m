Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C4F6867F2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Feb 2023 15:05:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNDjd-0000eR-02;
	Wed, 01 Feb 2023 14:05:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1pNDjc-0000eL-Do
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 14:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mYY8AT0ENZljGYO6C36OZtTsh5N/Rgqc7QoUfqtNprw=; b=jZbx0c9SkR7qYwYRPnTAEFT9Kg
 qP6tDSGTafqd0Qopt6ik4rmrNYFgn+zv0tvT/XucNm3P4+0WajhgiDRBF7HrKcxi8aPljF/kvW9d7
 PR5Wi0BbyQla85jychBevPliGHIMQHr21WThn5fOHLt2mopeai0Bg4k8oxR8JLQuk+cQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mYY8AT0ENZljGYO6C36OZtTsh5N/Rgqc7QoUfqtNprw=; b=eKw+mpAvYqQ54wlfdLkCQivxgb
 qlRW/Wr+qtx7l37b+9Ws+4qqc6F0tFpyOuri7YO9J06vDiCC1vfm3U2kDUTGlGM+A1YwavtsNECm2
 /fTMT5MsqkjXMQKuFhhymU42KQ46O4htGuIRCwneJTulZJxRK8fIfkxEJvzNl1pECLiI=;
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pNDjb-007MVX-7R for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 14:05:11 +0000
Received: by mail-pf1-f180.google.com with SMTP id 203so11384697pfx.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 01 Feb 2023 06:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mYY8AT0ENZljGYO6C36OZtTsh5N/Rgqc7QoUfqtNprw=;
 b=AbuPCU9Tw0G5TTVc51fl5WvI38E1Rmzh5FShZrE3cucqPCgOc2Yi0QgNCbbpMV2heM
 hMXm3e4/fDHgw/FTr0beIUcg67DkLTsEWMlT00c4cWwrrYfX2z6TnGPelTFc+HIkEIDe
 Ouqu4hQFo4qzZRVsvhbmXaZC9AKQXPLhzwT7vdSdbAd1sxDXY/WXtEwR4RqGUw6UMn0p
 O1fvyW36YkMIKF6owbirP6Mxe54zSFHMT6Tuds9y6GX2DJG7HsvnVHx0nf4kdHXSH+mM
 NHrDONd0dOpFxN7VmY3Ge8n0gsk8PKxfO37xhfQf6HWtjD6hAr48Lx5gOLzx5NZKGLwd
 hAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mYY8AT0ENZljGYO6C36OZtTsh5N/Rgqc7QoUfqtNprw=;
 b=36j+xkUFnESNRwvYOtCPWn/WOiIPCe/tmD+zHNgVPb5pLk+qFGuvaAGh/sT3coAH2l
 GAQ0fpRPetVQnhapeCwLK/uZXEtvOpSZ0rouuYiaG1xyO+d36jIObacuBLS2b7gOq7/+
 vTAVWnp0G2mh9Vu0W5qKA20eHZfNvqdr1Ohjn/1vH+xS/7x8ZTHpzpW9lNViArKTCZ3j
 SCYdjx5J3eEoheC4dQlusn2+a6+XseT23ab1fYCY/1gnzrokev6kyuD72fwB915igOAk
 X5jxU9vsvuNM3FuOby7PrNsoo0cC7B/Qe+w+XNGT7+OWToh2WVvSNY1OsThGJ11PXqzy
 RUlw==
X-Gm-Message-State: AO0yUKXXHEiK9rLMYARAlY6aumbAyaXms4tmt7HPzghoQAzWFfa343es
 KwDrTopO+UQexuyH5OVKp1k=
X-Google-Smtp-Source: AK7set9x6nWuFrvi6ArGt3T+3uQRCwNeeLU8SBVZ6ln0Utp7Gt+56jRquS+ahU+0v5NzakhFDYUDvQ==
X-Received: by 2002:a05:6a00:1d89:b0:593:afaa:b5e5 with SMTP id
 z9-20020a056a001d8900b00593afaab5e5mr2202126pfw.6.1675260305524; 
 Wed, 01 Feb 2023 06:05:05 -0800 (PST)
Received: from qxy-XPS-13-9360 ([43.224.245.247])
 by smtp.gmail.com with ESMTPSA id
 e5-20020aa78c45000000b0058d9710cb18sm6879770pfd.2.2023.02.01.06.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 06:05:05 -0800 (PST)
Date: Wed, 1 Feb 2023 22:04:59 +0800
From: qixiaoyu <qxy65535@gmail.com>
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Y9pxi7C+uUumQKFA@qxy-XPS-13-9360>
References: <20230113125859.15651-1-qixiaoyu1@xiaomi.com>
 <20230116030850.20260-1-qixiaoyu1@xiaomi.com>
 <7c12ebaa-4d3d-e475-dfb2-7b459cd26e64@kernel.org>
 <Y9ZWDVV3HJ431Fis@mi-HP-ProDesk-680-G4-MT>
 <Y9pZqOMBipT2NZk0@mi-HP-ProDesk-680-G4-MT>
 <938a8e61-4e47-1acc-938c-c90d213d2c86@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <938a8e61-4e47-1acc-938c-c90d213d2c86@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Feb 01, 2023 at 08:57:33PM +0800, Chao Yu wrote: >
 On 2023/2/1 20:23, qixiaoyu wrote: > > > > > > > > How about updating as
 below to avoid lossing accuracy if new is less than 100? > > > > > > [...]
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.180 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.180 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pNDjb-007MVX-7R
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs: fix wrong calculation of block
 age
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
Cc: xiongping1@xiaomi.com, qixiaoyu1@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 01, 2023 at 08:57:33PM +0800, Chao Yu wrote:
> On 2023/2/1 20:23, qixiaoyu wrote:
> > > > 
> > > > How about updating as below to avoid lossing accuracy if new is less than 100?
> > > > 
> > > > return div_u64(new * (100 - LAST_AGE_WEIGHT), 100) +
> > > > 		div_u64(old * LAST_AGE_WEIGHT, 100);
> > > > 
> > > > Thanks,
> > > > 
> > > 
> > > We want to avoid overflow by doing the division first. To keep the accuracy, how
> 
> Alright,
> 
> > > about updating as below:
> > > 
> > > 	res = div_u64_rem(new, 100, &rem_new) * (100 - LAST_AGE_WEIGHT)
> > > 		+ div_u64_rem(old, 100, &rem_old) * LAST_AGE_WEIGHT;
> > > 	res += rem_new * (100 - LAST_AGE_WEIGHT) / 100 + rem_old * LAST_AGE_WEIGHT / 100;
> > > 	return res;
> 
> if (rem_new)
> 	res += rem_new * (100 - LAST_AGE_WEIGHT) / 100;
> if (rem_old)
> 	res += rem_old * LAST_AGE_WEIGHT / 100;
> 
> Otherwise, it looks fine to me. :)
> 
> Thanks,
> 

Thank you! I will update v3 soon :)

> > > 
> > > Thanks,
> > > 
> > 
> > Friendly ping
> > 
> > > > >    }
> > > > >    /* This returns a new age and allocated blocks in ei */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
