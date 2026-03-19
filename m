Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDQ5F0j4u2llqwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 14:21:12 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CE32CBDB7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 14:21:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQFXIW3dTrsMBYBzdRo8ALVBNGvz+JItJj1pqmVf4iI=; b=V/H07ZpGgV9YgRtgjU7AGXiIw9
	2zoSC8nKz89xXiuiQfQxCnibYdGDCNJPsa8T8tGxpOY2cGDr5nC81yWibfgNSqiDJPBl/bdiT6duF
	ZH3PmUTwa9DE8olHv3i1WtClkHRi7apyvUKGUjByoQSfpsRpaG8q/lfgQevyfKAaW+c0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w3DJ5-0005FN-V5;
	Thu, 19 Mar 2026 13:20:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w3DIt-0005F5-4y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 13:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y/g2HVK/Agn1FZI6vrSA4fMqJowzNLFnDNSxmfKcK4o=; b=jrO5xQZ0corvQolw5kfJgIoh/A
 byVxIZKrQUEzMhXS3kstf4nwDX0rUUN6WuqiB21gkA10r5++9CGXhR0KoHd+2uOatFHkToo8nyVWB
 sQ7pqtHujdFmqaN61OXKSSmTXWZfZznClYwrLIX7MabYl9lKuN+oZvijjBL4MZcrWcqA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y/g2HVK/Agn1FZI6vrSA4fMqJowzNLFnDNSxmfKcK4o=; b=T2Nt2ytnsb5+zp3JVxO/hVi41K
 aZTK4c6IS4QiBwhnDppu6LsvqdNiYWP91+d6QDThes+3kQ/9Ph6AhUl26QzCYxF36bx/ZcW3uHKop
 +sAozAFr3Ia4v52wi4oOD++yFod9IWco+w0IRhIq8pLXWdWOacfT0HVIA35vcE3t4VdA=;
Received: from mail3-163.sinamail.sina.com.cn ([202.108.3.163])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w3DIs-00073d-2t for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 13:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773926446; bh=Y/g2HVK/Agn1FZI6vrSA4fMqJowzNLFnDNSxmfKcK4o=;
 h=Message-ID:Date:Subject:From;
 b=ggcd909lu6fa2qtITuktxyhgxdAwhxzj4ePJkclH6tXdgXqgUS0sV2IUiLPI7gFwj
 5LkX/ONJTg43idpSvIOOPSMGyg2smsJfspm4XYuMMOGedtFchjrsGM4dsOx5W5O31/
 VAXl1wc1UTrQ+Cf/nTMz6+v+QZ3neNsnhw1lbvYg=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.34) with ESMTP
 id 69BBF81F000050EF; Thu, 19 Mar 2026 21:20:33 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 2307356291731
X-SMAIL-UIID: C5BE4B8A519D46349F5FE4B8DE20D131-20260319-212033-1
Message-ID: <f10a3cbd-7d5e-45b2-8ebb-672eddeb1f14@sina.com>
Date: Thu, 19 Mar 2026 21:20:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260319083417.603605-2-monty_pavel@sina.com>
 <db3014c0-2e56-4c3f-8a63-2c335aafbebb@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <db3014c0-2e56-4c3f-8a63-2c335aafbebb@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/19/26 19:06, Chao Yu via Linux-f2fs-devel wrote: > On
 2026/3/19 16:34,
 Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> When
 f2fs_map_blocks()->f2fs_map_blocks_cached()
 hits the read extent >> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w3DIs-00073d-2t
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: fix incorrect multidevice info
 in trace_f2fs_map_blocks()
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,sina.com:mid,xiaomi.com:email]
X-Rspamd-Queue-Id: 56CE32CBDB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 19:06, Chao Yu via Linux-f2fs-devel wrote:
> On 2026/3/19 16:34, Yongpeng Yang wrote:
>> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
>>
>> When f2fs_map_blocks()->f2fs_map_blocks_cached() hits the read extent
>> cache, map->m_multidev_dio is not updated, which leads to incorrect
>> multidevice information being reported by trace_f2fs_map_blocks().
>>
>> This patch updates map->m_multidev_dio in f2fs_map_blocks_cached() when
>> the read extent cache is hit.
>>
>> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> Needs a Fixes line and CC stalbe tag?

OK, I'll add Fixes line in v3 patch.

Thanks
Yongpeng,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
