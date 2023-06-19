Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCE4735FD1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jun 2023 00:26:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBNK6-0000LT-8d;
	Mon, 19 Jun 2023 22:26:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1qBNJv-0000LF-Nw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 22:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:From
 :Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oC2tnKZazU9uVlrm2A6bHgfVySKOOyCWLXqbM4UiIQg=; b=QgRZu835b6QZ/V6goWPKanRJVh
 z6WrRLnOiKYjCEzHWlQZ+ibFzYbxcN1fD1n8EYN9kKqKH1oGon1iiGD/eJHK8hrFk3LxoKF20Z+Ds
 gbBd/3boS2VyQaSfW0aJTd/Eyt0HdfEUFpLBN4CJvi3v/Wg2227g4pksnQMBjsKKFxmA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:MIME-Version:
 Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oC2tnKZazU9uVlrm2A6bHgfVySKOOyCWLXqbM4UiIQg=; b=k
 9iI3lKqVkMSfUwVQFqB/3+zgctpVl+IwGD15mIfj24qGB7RBqhc1l71iKBWnFF9KZStzlswWauC2q
 xdFn1G2Xd1wz98TbuQek1Sv3S7TyembvzmPmZpAepRGorlhmEn3noD115QOZSgEIwVwbt57g3UIhT
 1sV45fHBx9xSIWPg=;
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qBNJo-0093gU-GR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 22:25:59 +0000
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6664ac3be47so711010b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Jun 2023 15:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1687213547; x=1689805547;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oC2tnKZazU9uVlrm2A6bHgfVySKOOyCWLXqbM4UiIQg=;
 b=iT9sfERL0SiBK1+79KP0UrfBj6j67RllURl+rtgoxgvPiToOhdaCisYQuvodFK1YQE
 wKU+GU08QFtwiBrnXAJw6lJWA7Karn/K7WXF+IZCdnhs5EMmtpn+El9exjSXApYbNY0X
 xsLzYr7kNxGxynLeom3YF6mvpyGv6OuHJu+6JA6gxUOQPtSFxLoh7XBJaDdmEmROUrVm
 HVzsOzZm+WhQL9ZSRBczJBewQVEO0yFblJ4a50Hau3IQHgyTHXEkOkly9jmzv6ec/bd5
 ja6w17hsyfOi/qgO+SZGbJdT1/uukHDXAez396VMV2t0IeZA1QxZ6Ruq1Q2tyoZc2ioy
 Mj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687213547; x=1689805547;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oC2tnKZazU9uVlrm2A6bHgfVySKOOyCWLXqbM4UiIQg=;
 b=c14J9jUN44VlSjgbS+UKmTM2nbmy3Z0eZoccRBLU2XFHjlsBNewOzkIS2Y5/TfctNG
 dsvgwDoAgE/1LlzwHhBVN+QrH4Qs6wAf7sy2wCC9P+Q/9ty0bUf+x3M9VburMmoKE4Ok
 eHvcvXtQm6kYhwoCPvxbQx8V+C5YZtkB1s8Q81MNypSRw8gtCAl1f3ZaD8Sza9DY0hp6
 iV+PIkAM0ysWwRIVVXljfXnIAolw3kC0rU9KY3ws6gPnOgcXQOq2haW2zDoLTqb+lelW
 KRFNj2KkTWBcOjHz1gHMj9BNvCIm8pI0Pq3En6rLIdTrFa5/pF5Rnw0yCcwx3QjEFaxB
 SoTA==
X-Gm-Message-State: AC+VfDxI+lXfFvwR7hoyzYt1UA4NECURVQfUdJHPM72a4jRJo2adF95h
 2vuRwfQS6aVgo1G81iBHR7kGJkV0MkB5pe6r6w8=
X-Google-Smtp-Source: ACHHUZ5dDre5JtwuZeS25jOuzOzvltt1rhev/GGrypbNGHP5rit3XtWQeaKUe6C2Iv3OsmxEJsi0GA==
X-Received: by 2002:a17:903:1105:b0:1b3:ebda:654e with SMTP id
 n5-20020a170903110500b001b3ebda654emr12740048plh.5.1687207438599; 
 Mon, 19 Jun 2023 13:43:58 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 jl17-20020a170903135100b001a65fa33e62sm235362plb.154.2023.06.19.13.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 13:43:57 -0700 (PDT)
Message-ID: <1dc1a0f2-9be4-8ae0-da26-3c00c8a71b41@kernel.dk>
Date: Mon, 19 Jun 2023 14:43:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>
From: Jens Axboe <axboe@kernel.dk>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi,
 I came across this patch in a news posting:
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=d618126911829523e35a61f4a5a4ad159b1b2c8d
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.180 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.180 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qBNJo-0093gU-GR
Subject: [f2fs-dev] f2fs async buffered write patch
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Lu Hongfei <luhongfei@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

I came across this patch in a news posting:

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=d618126911829523e35a61f4a5a4ad159b1b2c8d

which has me a bit worried. As far as I can tell, all that patch does is
set FMODE_BUF_WASYNC, and then just hope that the lower layers handle
the rest?

What happens if iocb->ki_flags & IOCB_NOWAIT is true, and now we do:

generic_perform_write(iocb, from)
	...
	->write_begin() <- does this block?
	...
	->write_end() <- or this one?
	...
	balance_dirty_pages_ratelimited() <- this one surely does...

If you look just one level down the latter to
balance_dirty_pages_ratelimited_flags(), you'll even see the 'flags'
argument documented there.

This looks pretty haphazard and cannot possibly work as-is, so please
get this reverted until f2fs is converted to iomap, or IOCB_NOWAIT is
handled by generic_perform_write() and below.

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
