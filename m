Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 635296C5A6D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 00:33:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pf7x3-0002TP-GD;
	Wed, 22 Mar 2023 23:33:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=438b69c7b=damien.lemoal@opensource.wdc.com>)
 id 1pf7x2-0002Rl-Ez for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Mar 2023 23:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l6hkpKOcOY8NpwboXsUov7Jt4IU4ocTzBl+Vzb6WK5E=; b=c62FBtsSZ4F5+EphKR2wL2x6Ie
 S0atRXHV6GNjcQcxyz2bzidHJIrrX/4d7JUzdgB4J5TbPSY32uModCnFvHSwMXZ6Ij9Mt6qyTrfYE
 +294ZTsLKKsfAJSVdsjke+lJ0SLguxz3MuKaTp+yT4Qq/PRR6ZoQthntaDuOiGuC1UB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l6hkpKOcOY8NpwboXsUov7Jt4IU4ocTzBl+Vzb6WK5E=; b=c4O/Z9HIy0+FyoU2Lhsg1txtix
 Rf7/z13H6ser0phzn4y8txd13vRyNjmxMxvDA5ShFUVpFffgfvRXFPef3TCvaWD5yaYgeCAjJ492L
 QAAmuAQGivZtUxKM10eYA8Kdv8bD8BX+8MkHKw8hWg03nVwnk9RAMwLxpriuhXZoq5o0=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pf7x0-0005JL-TO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Mar 2023 23:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1679527982; x=1711063982;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/sMDVlPS5fB9EHCZTtEBdVrU91EFHxBPiTjA7AnR9GU=;
 b=Q58+c65S7rwd9ejE7k7dbyAfvmxQeSFpxWeAb68y4ngxI60g24ZfVGix
 S9rjW/+KMiBtSHxfu5xZ22Jl4jwavCCyRYJtm+yPQmBYlsUK9cOhsGPhq
 23czuZ+/+hsMwXqTG9YT1lnnJzMDPiUmo6adRkG66LWZdivPipcIPuq/S
 mee/GSqTocQuIcQcqZduSyOcYCXq0rW8xdFdFM9XWrNHpR2WRpBupNn1B
 miyjsAYwnMp2T8acC+hHq6pBdzrQrqN3thIh2ye8ulsdbH4LHoOY3lQS8
 INGOr7erzyufAXrfI4LN2Ll8yWbrVQt/o3S1C+2pYx/nSPbCkdYM7hyAZ A==;
X-IronPort-AV: E=Sophos;i="5.98,283,1673884800"; d="scan'208";a="338330735"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2023 07:32:35 +0800
IronPort-SDR: 06yT4lk26nKRELt0yvLNqP4AEtzJKsyBfay2odtRQFdItgAbUcjmAiYwhyyH7Dfb6DDhpRSQxN
 EtbnxIpQS8WoTv6/4ViljwnaBw9beE1bSmL19JUqeGGBEcDbcUVskpmXOuae4a5WyXIDG2+GRd
 bvaYgjUNmnHNJHVRBIT29e4XQZGRHAVvUraXR6AoCPzi4hUKMf/Iwsov1fnthIQNm3zdne5YvX
 Afzem8dHHjucv+jlxlXv0aDgRj5vO4kW350guAyZik9qilPDUUR2AosebVPPpEAWuG3gHBWFf2
 r0U=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Mar 2023 15:43:11 -0700
IronPort-SDR: x1hYZeoTCfaa0ALuKM9X3/6Nfah9p82lfUVmKBwuZfMNqZbs295Jk+TPTnMgXyBUeIXyYbH++a
 zf+GVtp+OngY8a6mBZK/FM/fRBCOGxo6b6pG53GcQVDgaG23iqdJuGeTEsNK39Ugl6gtRyTM4s
 gYCbkoX5Nfeqv72jjrjevKS45AtQ436xw/iD1msO8ggFFsrelqvOiU81tQAvcRXv/MT0grg1Wp
 1JTXnxnSS0iWgsSkonHEdyWw9ASoids9FDseQtJ/JuONY3FONrvYtxoYTuA+1y1eWGzP2KJsUv
 BhY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Mar 2023 16:32:35 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PhlBW2bdPz1RtVq
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Mar 2023 16:32:35 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1679527954; x=1682119955; bh=/sMDVlPS5fB9EHCZTtEBdVrU91EFHxBPiTj
 A7AnR9GU=; b=TewiAhSCtGFAJ3EYSH4tyoW5+Oz7koC8deXt17QnsbIjHzyj1qC
 YgEAxG1mLuExMfsBi96LtQiatsHUV0CRbAXL6go2mmefK60b4yRXpnfzfya5iDkS
 j7xiQ9YPk7Up9Gc+kZ92EZD59Bw06eQk/TO2Ym+nEKrGyinTS7LLP/ckJnCgzYIp
 ei04vzysF0pSmjcOkq3wo8kDo3gObq0lNakakeQO4U+lVkPO1EBT4htzWD9J0dPm
 26ZKHUdh6RRqCXz0ArcupAwk+gRRMWvjy03mo+sZxoDYgdi1eXV7bY1yOYQlKCk8
 PnDDVNLH7hqxBzptFObe50bnxk+AhxVurxw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id vQd-2u33r8hM
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Mar 2023 16:32:34 -0700 (PDT)
Received: from [10.225.163.96] (unknown [10.225.163.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PhlBT6XDgz1RtVm;
 Wed, 22 Mar 2023 16:32:33 -0700 (PDT)
Message-ID: <52151084-ceda-c8f9-2151-00ac5f50c651@opensource.wdc.com>
Date: Thu, 23 Mar 2023 08:32:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
References: <20230322165905.55389-1-frank.li@vivo.com>
Organization: Western Digital Research
In-Reply-To: <20230322165905.55389-1-frank.li@vivo.com>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/23/23 01:58,
 Yangtao Li wrote: > Use kobject_del_and_put()
 to simplify code. > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 > Cc: "Rafael J. Wysocki" <rafael@kernel.org> > Cc: Damien Le [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.141.245 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pf7x0-0005JL-TO
Subject: Re: [f2fs-dev] [PATCH v3 02/10] f2fs: convert to
 kobject_del_and_put()
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
From: Damien Le Moal via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/23/23 01:58, Yangtao Li wrote:
> Use kobject_del_and_put() to simplify code.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
