Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F6A68F3A1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Feb 2023 17:44:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pPnY9-0002Ja-BV;
	Wed, 08 Feb 2023 16:44:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <torvalds@linuxfoundation.org>) id 1pPnY6-0002JK-0i
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Feb 2023 16:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5ldS/9lgbAryUlzaEqo027FaU3ababbmuo6baFKv9sM=; b=GwhV5viHYMV4ZpcCZ6UToRlQrp
 EEa7rQaanq8g4kx7FAa2FWeSnV4iJsNij9ZZyyZZPYwSORmgJhP13HAcZEoCjqpJoSd/uhRT6lKT3
 hSmTOfHyKrW5smkKu5uXFD8rKN4otuHdOV58jcZzrmzsAElmdVOzz/f2mHo9J+1v0+K0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5ldS/9lgbAryUlzaEqo027FaU3ababbmuo6baFKv9sM=; b=S3uPTDBkry7VSVDCRlcSq99b+B
 RBOqcEEaVxP/wVs2vHwjlwDJdr0zmwokQEg30E03POuPW61PNcJPBH+8Jdvo/40D5QN16MQQq11Ga
 UX6v52SJ2ozwT5o1Wj9CAsizmLSUQYLYSIB4LYy5ZRAf4JfyH3T+/A10gZ1Dnq7OmTcU=;
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pPnY3-00FF5C-Df for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Feb 2023 16:43:57 +0000
Received: by mail-ej1-f42.google.com with SMTP id rp23so1521237ejb.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 08 Feb 2023 08:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5ldS/9lgbAryUlzaEqo027FaU3ababbmuo6baFKv9sM=;
 b=GMKcvLbWgYYOV8D3gsJ1NLFPsx/+rb4QbvXLP5DPdEX/7OtnyJYn0eSEvrkIK19zWo
 BjCy3lR5nl3V/D+qx2u/4QrQu2ABYM65YPAlg3ZH+V2JzoEt7pgPNZH7lJ1yMN2zh5qx
 oiCs2/g3lnxsmmeEgvnZSDKkH0EEM32NJxdQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ldS/9lgbAryUlzaEqo027FaU3ababbmuo6baFKv9sM=;
 b=qyc64vOuQhGzxn1SwIEsESN0OXYgIpqtcqaZ1ravd5RXQrNB/iX4hrG9dkqsq0ZWma
 RatJRGP6/fju+aWVTskrST2PNSwulv49tV073e7v/HR1lJnSQmN8m2QKI1sImXcjzHve
 njeaOKbxXhk3r4L3IQQBaWWmLo5SLj2oWx/erDFyph0QgG1ieSlz2C5NN1+AQ9lklGRP
 ONEQ/RIaK4SQZRiu6hTivZSjEBxIO/eZoPVjPdssuwAmRf3tmhQNARgRfK6JvaNsnnoh
 gS5+CTpdyC/Z7R590hmpTf8+B2H9+m0s7pqe8eESe1U+B52YC0UkoY0SxJuhSIUCCjlS
 ulZg==
X-Gm-Message-State: AO0yUKVS1JtR180mHpHrgz/PosDX4fkM81ExX3ZCOG08HByWJAQUYTP+
 Z3P0Mn8v12mt4oVBSyqXPMlDajh/C9SXiYL+k6HCfA==
X-Google-Smtp-Source: AK7set+9VN8dHDQcY/ebD3R40/IVVyudg1mlf2JbNOk3YnYiM20iN3oBc64VL6BJeEBdHty3TDt3hQ==
X-Received: by 2002:a5d:4d0e:0:b0:2c4:553:e9a9 with SMTP id
 z14-20020a5d4d0e000000b002c40553e9a9mr2072650wrt.43.1675870723580; 
 Wed, 08 Feb 2023 07:38:43 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 t8-20020a7bc3c8000000b003e00c9888besm2274832wmj.30.2023.02.08.07.38.42
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 07:38:42 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id v13so20950943eda.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 08 Feb 2023 07:38:42 -0800 (PST)
X-Received: by 2002:a50:d0db:0:b0:4a2:6562:f664 with SMTP id
 g27-20020a50d0db000000b004a26562f664mr1769251edf.5.1675870722462; Wed, 08 Feb
 2023 07:38:42 -0800 (PST)
MIME-Version: 1.0
References: <20230208062107.199831-1-ebiggers@kernel.org>
In-Reply-To: <20230208062107.199831-1-ebiggers@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 Feb 2023 07:38:25 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg=5AqsG_1Td_bOMpFE8odKhsT9Mb3s4Wp+qq_X1Z6gqQ@mail.gmail.com>
Message-ID: <CAHk-=wg=5AqsG_1Td_bOMpFE8odKhsT9Mb3s4Wp+qq_X1Z6gqQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Feb 7,
 2023 at 10:21 PM Eric Biggers <ebiggers@kernel.org>
 wrote: > > I was going back and forth between this solution and instead having
 ext4 > and f2fs call fscrypt_destroy_keyring() on ->fi [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.42 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pPnY3-00FF5C-Df
Subject: Re: [f2fs-dev] [PATCH 0/5] Add the test_dummy_encryption key
 on-demand
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 7, 2023 at 10:21 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> I was going back and forth between this solution and instead having ext4
> and f2fs call fscrypt_destroy_keyring() on ->fill_super failure.  (Or
> using Linus's suggestion of adding the test dummy key as the very last
> step of ->fill_super.)  It does seem ideal to add the key at mount time,
> but I ended up going with this solution instead because it reduces the
> number of things the individual filesystems have to handle.

Well, the diffstat certainly looks nice:

>  8 files changed, 34 insertions(+), 51 deletions(-)

with that

>  fs/super.c                  |  1 -

removing the offending line that made Dan's static detection tool so
unhappy, so this all looks lovely to me.

Thanks,
             Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
