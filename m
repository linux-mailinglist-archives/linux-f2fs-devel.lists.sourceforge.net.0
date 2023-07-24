Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F76575F156
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 11:56:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNsJB-0005AD-8q;
	Mon, 24 Jul 2023 09:56:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNsJ5-00059y-Ta
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 09:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=am2eIoStEhYj6reS+R983QZxh6h3W0xYr71gNNToCQ8=; b=bmh14qX4AjQ0iMRvtaR0vsSCoK
 ickshDuxUw97JHdjaNjjDVqU+mGXkIUpNZJQgazDxa7OT3ZtV/4pGiZFW2FPwigMmOOLNKEyadbQg
 zj9n/DJPlj/9S2862N5Ltfr4JiI0edk/K0RFU3gJbIbdnD4RI0ejKC0OENz0JqtKjh2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=am2eIoStEhYj6reS+R983QZxh6h3W0xYr71gNNToCQ8=; b=kMPeE/+b3mv+EzRaV8n1jS5qeZ
 UdpB4izBwH+vSvMGxSgvqHRuRbMXkvPvDRX4spmgEMIZc3ZQ1UHmqUfilQwjtfHvMIkul2IaPeEkt
 NlSy4WvxotWEn1b8RnewOHxx6oGI7ml+rMz3Wp8RUN1/B02H1YqjF4xCGb1JWxV7vbu8=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNsJ4-000Onx-Ij for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 09:56:48 +0000
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-682ae5d4184so1051744b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 02:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690192601; x=1690797401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=am2eIoStEhYj6reS+R983QZxh6h3W0xYr71gNNToCQ8=;
 b=OlJHj1/yO42yQ42YyfDdqtfuDdXGGV/WQ0GpL38YIfO5RJZmkcdCx+PepLtkyGVzEN
 bTK4LhGsJI+OJKO7VuvlEDj/aPd3bZAexndKWivptO/xeLBD7J/JCOubjicjaVNWXLQ5
 H6fB+0YsEx63uc5TiCs20sSEjZ3JxRWkjZHG3LQbatv3J9k4pmh0VpqAg7R562nbzzly
 s71ebLgHH+wdbZuHYfqIuXfOS4H3wCLtxZ6Rqc556hBiF9jLddR68NJcthdMi5JsNo9F
 fUAZvFHEDsznNwsCMgykOwv5P0YMuteT/vvRsXd6nvRv9Clc/Ic3a7YeuRAtFe+vPCu7
 EZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690192601; x=1690797401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=am2eIoStEhYj6reS+R983QZxh6h3W0xYr71gNNToCQ8=;
 b=HWDHOcVNxSqCUZWH6eaO4Xl/E99NHH8ag+DApRvHP++o/ds3sgxjcr/+OQ7zFoTnHW
 SjE6TmB33ln+G1gvqPvRAybH3Of/px5Q4r9o9j+yBH2+xDWpnbp4nhQ8+IcjG9m/Ps9n
 03ilQD1Ytj6I9g1UcA9WhYs9w0fGtU4QQIvFopfzdpYPfdfqXBWW3ecKy6aZrCkPGZPz
 lkfz2FC35IvHKueHjzB9HbD13dqaSyLoPtxDfkvJWEAIY/qcTzOyJkp8QeJzIVX/1GEy
 pkMHglaDYi43NJ+2V5i1gg7IBM+sxZfgB8gPRc6u1OISMX8+kVaRzmGemmYIU0TVW4Ku
 m39Q==
X-Gm-Message-State: ABy/qLbvWt6pDGnZ7GLX18Llp48YaZGdTqFJtEfc/E3CFLjwJDALVdWF
 p2zrGwK9eBy+7fGgnHXMmkLqgw==
X-Google-Smtp-Source: APBJJlEtnCzvJ6I1rkWEELadVXHfZtUE/plpWIuGp/MFKpOvTS509ssN84iHDxA1POdeL3+D21rKQg==
X-Received: by 2002:a05:6a20:8e04:b0:137:3941:17b3 with SMTP id
 y4-20020a056a208e0400b00137394117b3mr14532126pzj.6.1690192601020; 
 Mon, 24 Jul 2023 02:56:41 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 y1-20020aa78541000000b00682aac1e2b8sm7356787pfn.60.2023.07.24.02.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 02:56:40 -0700 (PDT)
Message-ID: <7b4eb3fa-1ebd-de07-1a16-9533b069a66e@bytedance.com>
Date: Mon, 24 Jul 2023 17:56:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Content-Language: en-US
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-6-zhengqi.arch@bytedance.com>
In-Reply-To: <20230724094354.90817-6-zhengqi.arch@bytedance.com>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch depends on the patch:
 https://lore.kernel.org/lkml/20230625154937.64316-1-qi.zheng@linux.dev/
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qNsJ4-000Onx-Ij
Subject: Re: [f2fs-dev] [PATCH v2 05/47] binder: dynamically allocate the
 android-binder shrinker
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
From: Qi Zheng via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


This patch depends on the patch: 
https://lore.kernel.org/lkml/20230625154937.64316-1-qi.zheng@linux.dev/



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
