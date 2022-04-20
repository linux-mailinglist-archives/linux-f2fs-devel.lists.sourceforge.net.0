Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6F6507FBA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 06:02:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nh1Y1-0007F6-8r; Wed, 20 Apr 2022 04:02:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@kernel.org>) id 1nh1Xz-0007Ez-G1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 04:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x8R7mXHv2E9Gmn7gfmk5ClKc3Bcn7khtUwFYAqiLiqE=; b=X1nVnNuqS2wbk9YQjVJPNU9jIe
 8gtwKOB6N0jhdvMXcX7KB3DUze2U6E13OnhPxcpAYy55DoBY3QQuaTgZpUq7V4RPVO9HOqL9A5Lqt
 ef6Fvl00bmnKb8EeXujMPNnDXN412BQfy8Olwhn1iKuO5kw5aoA5D3YiUht2n2XaumBw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x8R7mXHv2E9Gmn7gfmk5ClKc3Bcn7khtUwFYAqiLiqE=; b=izYBbBZqK/uvN/MJjZhOHAcac3
 csSrx4JLUSFQ5zH9YIfpGbaAiY2YafIhTdjMqfBLUalW2SrGytlZ+9QxaZ7v9l/LU/nVpMy0l4Gcd
 /cgr8zIbvEypT+g4cxmxJe2f+SODZLbq4FOXUNZRzFRpr3lXAkS7E6qmz1SG3qlYXH44=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nh1Xw-004NRt-50
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 04:02:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE57D616D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Apr 2022 04:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042FDC385A0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Apr 2022 04:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650427334;
 bh=rWPTIEy8yYReWX0HRAZ5B5jMc0RwXDYkgDQRPbIhahg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=udj+Ysm9HMxwhKeJmEKQwVLozGFbLd7V4DLVkRuuZjWPuadUCa3lenfQJUH64uorf
 41sgdWrS5y+espyiFV8FoZrw/NOiaOQQGGxxndmisCxLXmo1hyVG9By1viVWYWcM84
 0A+p8uRYfgm6zwiIMfFzqOX9oT+uS+flOM+r4oE4R7Aw05qbxSmqiRl0puVP8dDfBN
 Ahr5o/PZq0QpI1dlnKdqRPfCNS6ANGO5KCLgQrEsLznWDUpOEkFBnjTVoQJz9kxbwl
 G6ezipktBHn07+YDnn+6v9Ve7ChnY7TGNO1xMUXxYJxOj31mh3L9wbY0blfO6/l0Ut
 IZuY3jnx1bqXg==
Received: by mail-ot1-f41.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so339502otu.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Apr 2022 21:02:13 -0700 (PDT)
X-Gm-Message-State: AOAM533vcM2srPRFMlpqzA/3wIXmfjY0aBO8MB4W6qaBirA+FWD1RRG4
 tBcascCsowGcbCQfn2xTnZ/1ezc6YVKAeblXrK8=
X-Google-Smtp-Source: ABdhPJywGk6fJNPAU789SetJ7XIlQLirF3U4AFhxxj9qPcJLaKDm51KkhNRo7HZ38lhe7ZOaEIofgMJDvPLKFe8Kl94=
X-Received: by 2002:a9d:1f5:0:b0:605:4b5e:93d2 with SMTP id
 e108-20020a9d01f5000000b006054b5e93d2mr5053391ote.234.1650427333083; Tue, 19
 Apr 2022 21:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAB=NE6U7AnJf3_eHG_ZmVA66YfjH4rT+7dYiHgEurArpQS489g@mail.gmail.com>
 <Yl86tKxvBN6lHoma@google.com>
 <CAB=NE6W3r_O5L30pPLJ9s12ahfBGvudFAKyLbO_1=JCf2bDTkg@mail.gmail.com>
 <Yl8/2cPCkSZ17hxN@google.com>
 <CAB=NE6U+KbnFPd+EYEhXxF7o4DSB58k-uGevC6y1h2SSE2sbtA@mail.gmail.com>
In-Reply-To: <CAB=NE6U+KbnFPd+EYEhXxF7o4DSB58k-uGevC6y1h2SSE2sbtA@mail.gmail.com>
From: Luis Chamberlain <mcgrof@kernel.org>
Date: Tue, 19 Apr 2022 21:02:01 -0700
X-Gmail-Original-Message-ID: <CAB=NE6X8e48pvKd+4Ms3c89gcUzh58Nd-n_xxyD5HRkEGbks3A@mail.gmail.com>
Message-ID: <CAB=NE6X8e48pvKd+4Ms3c89gcUzh58Nd-n_xxyD5HRkEGbks3A@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 19,
 2022 at 4:26 PM Luis Chamberlain <mcgrof@kernel.org>
 wrote: > Oh... so this is not upstream... I see.. ok hrm.. Any plans to try
 to upstream your delta? Luis 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nh1Xw-004NRt-50
Subject: Re: [f2fs-dev] Baseline for f2fs
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
Cc: Pankaj Raghav <pankydev8@gmail.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 19, 2022 at 4:26 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> Oh... so this is not upstream...  I see.. ok hrm..

Any plans to try to upstream your delta?

  Luis


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
