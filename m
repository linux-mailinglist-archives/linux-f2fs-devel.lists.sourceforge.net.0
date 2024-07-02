Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F25589243BD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2024 18:40:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOgYa-0007kO-Op;
	Tue, 02 Jul 2024 16:40:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <htejun@gmail.com>) id 1sOgYZ-0007kG-1g
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 16:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YLjzpfOvERsnkj5AGhl4LZNfD233yRKm3p2HBwKY8aA=; b=F8j8YSKeucsEJhp6KzKUo/OAT7
 3REfOpBhCeCOc3vIL8RVuEtTjgANh993t1luY3CWx+anZvo+W4qzOrq+I5Ij2vODWKYBKIjiepkoE
 BoWYovEXrybpgDZ+dc89Yuq2SxP1bkMIb0L+zwsy/HY0OYZw7pUvBMhZ6IPVuB5K/Dr8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YLjzpfOvERsnkj5AGhl4LZNfD233yRKm3p2HBwKY8aA=; b=SmYQy8rxm6R3VDKki/xDq+AqKa
 wLaqlozhhucrOz1ITXepOgw5cZeFC6xVJy2dXuHAXbmaVWJg3v6PQ4d8esJzwtNr5bMdDB6nerHHH
 fDvBgBYPZ8EhYP+1X/fx4BxyURWrq11niIyFih5E4IRz/1f7O6SMZrrBp9rKkNig4Tn8=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sOgYY-0007vj-Jm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 16:40:38 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1f9b364faddso27332005ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 02 Jul 2024 09:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719938427; x=1720543227; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=YLjzpfOvERsnkj5AGhl4LZNfD233yRKm3p2HBwKY8aA=;
 b=QWLW0H+V6GnZTNdvq2979UwTYC8Rlxsw0tv9STtM/lAlVf5Vx9SFLkTMrqHcOcN1fv
 9iJ7hZt7HZNuIr1vmR4Xps98HBN3GQ6mLNrmKnfKr0RyVuNeL2eFMRodEfMUG+hzVN4a
 Qh4h7j6X+hes2rVzfWxrbeDjiZh9odQmAepjBwdrQkIHuQzgXUcBFMlkv+ddUW/RUKfe
 wGbxdVpruMren/SETy2onWQAYIJg3yEi5ywzVIgxsSryL5Pm+bpQldJRBuH8TDGHfdPN
 PjHpiaM2tfyJnobNDbJ+rvxKzEtianTNqmiNPdMPgtpN8YkWfWXN+ddlBRlFRlSFJMuK
 n0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719938427; x=1720543227;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YLjzpfOvERsnkj5AGhl4LZNfD233yRKm3p2HBwKY8aA=;
 b=kuksBCnLIJE5/GO2b0hC+bI69fDJyjdaNuco+P3v1nShNrRUraAJb7SDZ7U2al9jz8
 6FRVifkLMdm/WcvN7n+v8Rl/bouCjWlIyGTtaOBVnYrFYrDDQeVo27PWVhezebKtrBlg
 MRDVZ+L7pTRQzqZr2J3bN1F3pHT9iSX8cU5AkXRk/690zjCnW3p6GbUYrQprmcafnS70
 oz6GWAnobDyPlX2sWQR3UIvvSCggKlWXN4nVmnJw2gUxZOmwt5L6sMIOYm2QR7wQrwIU
 y3DOCBEMa/cF/ColpJ1XU3bs0R2AZVSwMQmQU+pvwhvh3XYxqxVf0bpSI3HOvxyuxBvB
 i54Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW6atppFenuAXPLdOZBksfEW1eBdkanvz3Act84YxjrBUMBjDKKI556yDR7KZrvpfsNZxnEI4P8KPxyvZx8HI5hPN4rX614rgtOZR7YMRyVY0ccJK2jQ==
X-Gm-Message-State: AOJu0YwyuENY6qVMUs/QuJY9jSZGYI2VsUZrXgrY+z0AFXR924EspRAH
 SH7eof5L6jlA++GYyCIAY0qyw0lWFH3XURqQb/z71I3YHNHu6NcV
X-Google-Smtp-Source: AGHT+IEkU7pdSd0LWYWG0EDz+PuGtP68IbeqI3hs+bqlHz2DFPsYUBDvHBRg+U6hh7EqKFlSiz5UAQ==
X-Received: by 2002:a17:902:ea0f:b0:1fa:221e:aa9a with SMTP id
 d9443c01a7336-1fadbc85f98mr60272605ad.28.1719938427046; 
 Tue, 02 Jul 2024 09:40:27 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net.
 [141.239.149.160]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1535b1esm86650705ad.140.2024.07.02.09.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 09:40:26 -0700 (PDT)
Date: Tue, 2 Jul 2024 06:40:25 -1000
From: Tejun Heo <tj@kernel.org>
To: yi sun <sunyibuaa@gmail.com>
Message-ID: <ZoQtef_6xfd4FAwe@slm.duckdns.org>
References: <20240701075138.1144575-1-yi.sun@unisoc.com>
 <20240701075138.1144575-2-yi.sun@unisoc.com>
 <ZoLoJ-uBo9qyAlMg@slm.duckdns.org>
 <ycmaxfuqpnj3vnmseikx7m7jkzsp2t2qtlncgub44xhxohs6du@hucdavhpcvpi>
 <CALpufv3bAsMey1DFb8HPbp8gPZWBU-6rrhvRWwVQsxXhPXOvdA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALpufv3bAsMey1DFb8HPbp8gPZWBU-6rrhvRWwVQsxXhPXOvdA@mail.gmail.com>
X-Spam-Score: -5.1 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, On Tue, Jul 02, 2024 at 05:27:19PM +0800,
 yi sun wrote:
 > Yes, adding the io priority attribute to work will bring huge benefits
 in the > following scenarios: > The system has huge IO pressure (these [...]
 Content analysis details:   (-5.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.214.175 listed in list.dnswl.org]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.175 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.175 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [htejun[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1sOgYY-0007vj-Jm
Subject: Re: [f2fs-dev] [PATCH v2 1/2] workqueue: new struct io_work
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
Cc: ebiggers@google.com, linux-kernel@vger.kernel.org,
 Kent Overstreet <kent.overstreet@linux.dev>, jiangshanlai@gmail.com,
 Yi Sun <yi.sun@unisoc.com>, linux-f2fs-devel@lists.sourceforge.net,
 yunlongxing23@gmail.com, jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

On Tue, Jul 02, 2024 at 05:27:19PM +0800, yi sun wrote:
> Yes, adding the io priority attribute to work will bring huge benefits in the
> following scenarios:
> The system has huge IO pressure (these IOs may all be low-priority IOs),
> and a work (we hope to complete quickly) is also doing IO. If this work
> does not set IO priority, it will be blocked because it is difficult to get IO
> resources. And if this work sets a high IO priority and passes the IO priority
> to kworker, then this work will be completed quickly (as we expect).

As I wrote previously, you can still get trapped in a pretty bad priority
inversion whether from workqueue concurrency or queue depth exhaustion. I'm
sure that there's some spectrum of contention conditions that can be helped
with just setting ioprio, but it's a pretty partial solution.

Thanks.

-- 
tejun


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
