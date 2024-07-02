Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E2F924408
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2024 19:01:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOgsG-0000Ue-LC;
	Tue, 02 Jul 2024 17:01:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kent.overstreet@linux.dev>) id 1sOgsF-0000UW-6S
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 17:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wl+tnsOYCLNKKFW0UKfvPEfM9LnzpqxnNJBS1fLJs0Y=; b=P3V0hr2W8tt+NGEZvQh9ANdknZ
 256+JLcOsAGYfJeK5qhUWZzbt+Jj1ncLmdP1FMydI5bIaVSFR8K0Kf6nSr28yFj8p3faCGw6lYoOL
 EPysg67WSU2S8fM7ZXIGJceg7050mGmlQxL9DiCrRtBcnXVjhXT0lkl6tQFhfezFeXDE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wl+tnsOYCLNKKFW0UKfvPEfM9LnzpqxnNJBS1fLJs0Y=; b=DmtJ9tV4zW8FyoDkOVcbUcwsnT
 22ASG8XSw74jmIN5tenFMWlPU5kPW/lDvLLbAFLFt830JTySVR1W48wMZfyGqQNMdPm8mnuldeCTg
 BSWA10YSrQrqXqPIbS37Jubgasf3c0g3iv2kMcj4VnSThk2FSBfefKg8KxHC/fdiFCZA=;
Received: from out-170.mta1.migadu.com ([95.215.58.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sOgsE-0000gp-Pj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 17:00:59 +0000
X-Envelope-To: sunyibuaa@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1719938744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wl+tnsOYCLNKKFW0UKfvPEfM9LnzpqxnNJBS1fLJs0Y=;
 b=OIavHQ5PMQZoEqcZL1HQyR7TjCX1RAvI11iOtZBvp6TbfVrA1OdViRyaYPOW6Dne2y1ajN
 Dig1y+6egNgvkus7i+J3l0xwiFjWCyqzoDbPsilZMC8kvS4pKBkkr+Ta3HuAhpB9TbufzV
 xcfQwWsfKu446tCOBS4pP2jjwuY9t10=
X-Envelope-To: tj@kernel.org
X-Envelope-To: yi.sun@unisoc.com
X-Envelope-To: jiangshanlai@gmail.com
X-Envelope-To: jaegeuk@kernel.org
X-Envelope-To: chao@kernel.org
X-Envelope-To: ebiggers@google.com
X-Envelope-To: linux-f2fs-devel@lists.sourceforge.net
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: niuzhiguo84@gmail.com
X-Envelope-To: hao_hao.wang@unisoc.com
X-Envelope-To: yunlongxing23@gmail.com
Date: Tue, 2 Jul 2024 12:45:41 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: yi sun <sunyibuaa@gmail.com>
Message-ID: <voitnfv6ipsi4dh4i7hufaq3o3ta2z36paan35yitdwmpl3jvh@2cbmzlv3qlyl>
References: <20240701075138.1144575-1-yi.sun@unisoc.com>
 <20240701075138.1144575-2-yi.sun@unisoc.com>
 <ZoLoJ-uBo9qyAlMg@slm.duckdns.org>
 <ycmaxfuqpnj3vnmseikx7m7jkzsp2t2qtlncgub44xhxohs6du@hucdavhpcvpi>
 <CALpufv3bAsMey1DFb8HPbp8gPZWBU-6rrhvRWwVQsxXhPXOvdA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALpufv3bAsMey1DFb8HPbp8gPZWBU-6rrhvRWwVQsxXhPXOvdA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 02, 2024 at 05:27:19PM GMT, yi sun wrote: > Yes, 
 adding the io priority attribute to work will bring huge benefits in the
 > following scenarios: > The system has huge IO pressure (these IO [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [95.215.58.170 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [95.215.58.170 listed in sa-accredit.habeas.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.dev]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [95.215.58.170 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sOgsE-0000gp-Pj
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
Cc: yunlongxing23@gmail.com, ebiggers@google.com, linux-kernel@vger.kernel.org,
 jiangshanlai@gmail.com, Yi Sun <yi.sun@unisoc.com>,
 linux-f2fs-devel@lists.sourceforge.net, Tejun Heo <tj@kernel.org>,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 02, 2024 at 05:27:19PM GMT, yi sun wrote:
> Yes, adding the io priority attribute to work will bring huge benefits in the
> following scenarios:
> The system has huge IO pressure (these IOs may all be low-priority IOs),
> and a work (we hope to complete quickly) is also doing IO. If this work
> does not set IO priority, it will be blocked because it is difficult to get IO
> resources. And if this work sets a high IO priority and passes the IO priority
> to kworker, then this work will be completed quickly (as we expect).

Why are you submitting IO from a workqueue in the first place?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
