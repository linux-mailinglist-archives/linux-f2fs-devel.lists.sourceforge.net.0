Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BDF5A17E7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Aug 2022 19:22:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oRGYJ-0000Ia-Tg;
	Thu, 25 Aug 2022 17:21:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bart.vanassche@gmail.com>) id 1oRGYI-0000IU-0B
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Aug 2022 17:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WKcoB3qpUbIap2Zi9gWvq3pPSSCudasqUwtUuNYR5Jw=; b=HpVlqPl9bZrd9PY2ZoYqTDjT7g
 eAuenwbEhvBPgvBEQd1LzWBg52/q6wPz5aGI1/FKrlQ15DJRFuKxB54hgDF92oVVCb7wGZDseK8f8
 pIw7EJDMv3NX9vNFCjUd1rEM9/pKfrSnlIM8wsUKRe0zalPwp5MN++iNmPrJgD4uu/YM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WKcoB3qpUbIap2Zi9gWvq3pPSSCudasqUwtUuNYR5Jw=; b=KIqH46ucoD/DnYPCFCFpZPEJlu
 X/RkIePMKpp1Wed3IYMYYFdc5pSI35aNNKV3JF05/yvpgbJkhMBbfZbEWpTWhwp70lzxgaY00ZS1O
 96DtJS11dkJRoTu+VyTdYDEn62dHtY/m/yv3ypohruNACuGggZF/TxqEJwvAihxWElqM=;
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oRGXm-00034E-PH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Aug 2022 17:21:57 +0000
Received: by mail-pg1-f169.google.com with SMTP id g189so4398448pgc.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Aug 2022 10:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=WKcoB3qpUbIap2Zi9gWvq3pPSSCudasqUwtUuNYR5Jw=;
 b=uwW7XPo+YVJ6Lv+utZUJqh5X9kzelJuDB8xP3+LWtKhSxt1rz1MJNelS9Aggn49Kbs
 ob0TR+Hh9056xsJbR6oW9SBR63iF5F1Bc+yFQwF2HG5HpRdzqj09Ax257Rtn5gOP+ayQ
 R7xQt6qCYfYU+Y50cPEVPD4MCZjvIRdmbkXM2K8ZEf1pXz1x/YY7hInpp2ULAVlz8dG3
 xOY1LGly3rsRtrUqRNugPrLTQx24kOAA96tOqt7Aa/mQr2300Nzfds8NB0bsCsbHnJxq
 07eXZEhyjqhVlPE+bYL88ijSHBjT9GDmKgPz69aKJE8sznGj9Miop9ypBdxc3aMskWRJ
 ii1A==
X-Gm-Message-State: ACgBeo2YdpQ/mHDqcSoJbBeMMHjMuIz+ubMy9GUgkQinsubz/MXHk/0V
 WCpK9syFWhM2nP3dqkZPFS/c1Mg/cY8=
X-Google-Smtp-Source: AA6agR7fAWrPrA8xF9ASSjD6Ro5BmUlajq7ldAxU75bIRwTNRVImyUyxmZ8dWUjX39GD12HK/QaeOg==
X-Received: by 2002:a05:6a00:4147:b0:52d:fe84:2614 with SMTP id
 bv7-20020a056a00414700b0052dfe842614mr62199pfb.10.1661448081151; 
 Thu, 25 Aug 2022 10:21:21 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:349c:3078:d005:5a7e?
 ([2620:15c:211:201:349c:3078:d005:5a7e])
 by smtp.gmail.com with ESMTPSA id
 mg24-20020a17090b371800b001fb6c6ebaafsm3821933pjb.25.2022.08.25.10.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 10:21:20 -0700 (PDT)
Message-ID: <1c70a112-7f5e-2dd8-ea06-031f00ba5264@acm.org>
Date: Thu, 25 Aug 2022 10:21:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220623181208.3596448-1-bvanassche@acm.org>
 <18f89be5-5283-9801-7d8b-5a08aa0d8928@acm.org> <YwaLXhN7+4q07VtJ@google.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <YwaLXhN7+4q07VtJ@google.com>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/24/22 13:34, Jaegeuk Kim wrote: > Could you please check
 this branch? > >
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/log/?h=dev
 That branch looks good to me. Thanks, 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.169 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.169 listed in wl.mailspike.net]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1oRGXm-00034E-PH
Subject: Re: [f2fs-dev] [PATCH v2 0/5] PAGE_SIZE and zoned storage related
 improvements
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/24/22 13:34, Jaegeuk Kim wrote:
> Could you please check this branch?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/log/?h=dev

That branch looks good to me.

Thanks,

Bart.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
