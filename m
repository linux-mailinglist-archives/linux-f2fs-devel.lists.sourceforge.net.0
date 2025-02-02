Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3F0A24ECD
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  2 Feb 2025 16:26:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tebrQ-0006rk-EJ;
	Sun, 02 Feb 2025 15:26:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1tebrP-0006rd-7I
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Feb 2025 15:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nAuHDWmks/PdDVRNMLxmVkyazEwen7unn+lyClwJsgI=; b=QntiPldi7s8tEHlqvusMLEWxYN
 i3cEY2EII3XkTDF5DhknqOQhVbMN51AGwPBbH3sL0v2H09G23LfpUNu19osveWUJL2qJ3a5RxBOaO
 Wi1iCDIy1qx1mNZMft9k7Y+kkdjFCYJUpMt5OclmnjcdQu6XbwVrllNye4Ti5rbQJg9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nAuHDWmks/PdDVRNMLxmVkyazEwen7unn+lyClwJsgI=; b=lz1uD1Iyv53Nyhbeyb62fJuImX
 Rl/ze4nxDu4TAIxndfcTQI5xmoSjLNCfdpdIxMKlMgdvncnJOvH69yaYBB0MjMZtJsP2jSqQoxqCR
 piBSO3Xmyxf2wfQLFjZi7NrY1hOhVH9daDwhtc0yNxpp8iIgoxhpByYWYAGH5VqpcUxo=;
Received: from mail-qt1-f174.google.com ([209.85.160.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tebrM-0001kO-GB for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Feb 2025 15:26:11 +0000
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-46fa764aac2so31710241cf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 02 Feb 2025 07:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738509957; x=1739114757;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nAuHDWmks/PdDVRNMLxmVkyazEwen7unn+lyClwJsgI=;
 b=frODVAY1jrIn2TwojMv5CClABhepZajoJHJD1yr5CwGMZ3YW18Bj4gI2u5OSm0cXyN
 Qe7pWPiQB8O37F0kO+w3tgsYafKTPWiRG7j9LllOChbpaSZoUDH1C1DK0ExF3GWHG3xs
 3yz2dCSy8RBUVYh4xKdr1eyMJxKjTu8M1Mm8GQWuGUgKbpmHHArLPw1cpFquXItqgtzT
 47EedimkbZK4iTSB/YRqjkVo8aSCqSd3B7tTH1k/I57XQtPB9JfsrA+zPHCLbqCgFr0N
 eU1mVGV5Zg79fBVJblbtKN3UEDDbUip1ay/Z+iEWe98wyS/MgZuVu8S0LMn+F3/5irtz
 qR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738509957; x=1739114757;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nAuHDWmks/PdDVRNMLxmVkyazEwen7unn+lyClwJsgI=;
 b=r5Xiibx40xEbGzDaVbwd3ihgY0c9VLiZkN4ekR2IfWrxTipb8estUa3tzHXVj46ZPL
 Ci7CWo4zRDUpbZeMSIWN1xtBxkgYwiXEde5V9O9DeTwL32kLaIf1v+qfjGA/BnK4AwjM
 6r5mo0SI0fyknV5PBa5Y0D7uMhf6s5gkpobXIt1F3BYviF8cTgmYfO9mPglHqViXVGf4
 DI1eohL7Hts6d6DTmzO+YjdKK6IcMABJ3VXovBZ7tBPlDL55szgsRhoqw7i5JmX2FTc1
 uZM4ZUiIA5v/fNfKa4+kheN41Zov2CpHzWX+Ki9xm6yB/f/WWd7vXTBFtPZNXbnxeNJJ
 NOig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxZxOavF7t3dwilO/03Hl1FqUtBalMBs4UtwanXP9VHMlOkOgUb5R0/4m2upOM6Fk0fF7eZf8KjusimvwQI2Wu@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw2AmtpsZyUNPmawb5/OxYdL0/BwZ+SZZDBHrVQNY6PV4Ku4ZA6
 keLdfl9YBTtOAUQ+/Gy51tJPfyhCPzSOWP3CcWjs3lwz79GDYPpGONGlxrgcuz0oEZgOch3+L9X
 L
X-Gm-Gg: ASbGncvcgw0rTe0Oer5Le2IMZ7rp8Ge8/jWT4WKFTLh821pMNY6z807Imwx/g5lcnjX
 XY20rhJXkX6Quv856/+wu++3e41X6v2FfaayZAKrL46YQTJwvO2oOp4EuVKIIo9E3u0KLmvq96i
 itZvYFOFuYc0vioDCltYDWFH1FDR9pmyB7woUuZmB3dgypUsHIDIwbydR15GGtotnJ0mWSrtyqg
 C8Bb50+9IYh78wNrnGqAgYvLTlMcOFJV4lS7dhcv8X7+gccjuFEYNVptoS/dovEkzyD262sHZg9
 CUyO7GFEBQ6U
X-Google-Smtp-Source: AGHT+IGukiziiC1rLjM6JzNMSPR3ZwXkwHF2OgEI6BKabzKWh1pSdyxOGKbkMwtPxxnvRPz9dK83Ig==
X-Received: by 2002:a05:6602:418b:b0:843:e8d0:a728 with SMTP id
 ca18e2360f4ac-8541111199cmr2011722539f.4.1738508713097; 
 Sun, 02 Feb 2025 07:05:13 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-854a15cf87dsm197686139f.5.2025.02.02.07.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Feb 2025 07:05:12 -0800 (PST)
Message-ID: <4c45eff4-e87a-4eff-a760-b3b7d86b1987@kernel.dk>
Date: Sun, 2 Feb 2025 08:05:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kohei Enju <enjuk@amazon.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
References: <20250202043253.64389-1-enjuk@amazon.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250202043253.64389-1-enjuk@amazon.com>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/1/25 9:32 PM,
 Kohei Enju wrote: > When __GFP_DIRECT_RECLAIM
 (included in both GFP_NOIO and GFP_KERNEL) is > specified, bio_alloc_bioset()
 never fails to allocate a bio. > Commit 67883ade7a98 ("f2 [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.174 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.174 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.174 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.174 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tebrM-0001kO-GB
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: remove unnecessary null checking
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Kohei Enju <kohei.enju@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/1/25 9:32 PM, Kohei Enju wrote:
> When __GFP_DIRECT_RECLAIM (included in both GFP_NOIO and GFP_KERNEL) is
> specified, bio_alloc_bioset() never fails to allocate a bio.
> Commit 67883ade7a98 ("f2fs: remove FAULT_ALLOC_BIO") replaced
> f2fs_bio_alloc() with bio_alloc_bioset(), but null checking after
> bio_alloc_bioset() was still left.

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
