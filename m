Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6A5AAD807
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 09:29:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbPC1w9d6lIlonliCaM6gcJf5/q4RYrdVWbKq7l2+n8=; b=FYlCTCVJ5ZeMrPlvV3HxRL8JbN
	8FLNnnEq1iXLbH4MdLl2Gr+qDrfr97gHBsRU5zmL0qnTGgjzFRZgZoFpcssSKj7R4B26PKhh8lbuE
	5FPuhvOWUUK2hY+JpkldnsIirY6Mvvi/bj7dLFosJfck15xydRbe+u7da0JNTtYeiOtY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCZDk-0005QP-Nk;
	Wed, 07 May 2025 07:29:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCZDi-0005QG-Qe
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 07:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q4vnmxifpfQsQCmluwPIONzMWbSBlR+5/UDO7rdtq/I=; b=hGmjQ9IKB0K+Qr1p+u3XbwDFaa
 lkp/FJ1CLVhgJWD4locGF0Y3gC5OQOUu/JI9qJwp5FlTbS3w05RWNiNS+LWVbZLYLxtWOAOoYWCTx
 DkHBS1dBl2zNSZivsZ8hZRAuZy5AcGBCbHzIfA5+zB4PwIKwYLEEpjyumyGn6ePfzss8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q4vnmxifpfQsQCmluwPIONzMWbSBlR+5/UDO7rdtq/I=; b=G0Q2TX1yZP44a0aUcCZWq/Ozil
 uft0o+sHljsKoCp34fn2JlMd+9g+vxn+8S0vL537VRutGyiHnXRaSowzuYHycy5W6woUBbJstzTvj
 EmfO2X3w3UjcBHXHF6aip4oqBoLrpFFHz1OtteUdgECbjChSP6RZwzS30c3xejONowhI=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCZDT-0002qD-4j for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 07:29:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 49863A4BC95;
 Wed,  7 May 2025 07:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87B6C4CEE7;
 Wed,  7 May 2025 07:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746602947;
 bh=7cURyXjXdoJmTyb8hLReJVBL1sTYAuBh4yrjjz9NI/g=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=OjHRLkUVX+ps0CQnHqc4HjSygB3ca5HmzNXyReL8SHXICmX9jk+mU7qyYbTsmF1Ds
 Y+lhLizkLmF9I9OzgQb5+8jsQTL7RjXq9VCVsngzPm2BYUvcUOin9XmNPKw3ZnI6Vm
 XdX6IvpCW9dzy8n2YVRs45CRvRWw9glf7a7XC+uSuBDsyCvkpKXjlvAN5l1jud1sxh
 SGVB3hcCv5rOeEONNwi2zwrrkuo/qLef90RdiryGY9OSZOXdcj+bRJ0zGnSHMknbYH
 pxV+I/jqZXKkNUTxTo13kMPGl9H8DsiemEQl2XLbRyNxk+aKXAUYdr0qAYMhjQ4oPL
 IjEQ3f7t68Epw==
Message-ID: <866f9738-cc57-464c-a14d-c167910cf370@kernel.org>
Date: Wed, 7 May 2025 15:29:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250505092613.3451524-1-hch@lst.de>
 <20250505092613.3451524-5-hch@lst.de>
Content-Language: en-US
In-Reply-To: <20250505092613.3451524-5-hch@lst.de>
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/5/25 17:26,
 Christoph Hellwig wrote: > __write_node_folio
 can only return 0 or AOP_WRITEPAGE_ACTIVATE. > As part of phasing out
 AOP_WRITEPAGE_ACTIVATE, 
 switch to a bool return > instead. > > Sign [...] 
 Content analysis details:   (-3.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCZDT-0002qD-4j
Subject: Re: [f2fs-dev] [PATCH 4/4] f2f2: return bool from __write_node_folio
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/5/25 17:26, Christoph Hellwig wrote:
> __write_node_folio can only return 0 or AOP_WRITEPAGE_ACTIVATE.
> As part of phasing out AOP_WRITEPAGE_ACTIVATE, switch to a bool return
> instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
