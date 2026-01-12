Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D28D11582
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 09:53:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:Message-ID:MIME-Version:References:In-Reply-To:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6SBxpswHpQuNvTDZM7QY+K3SnHAlDD2vL6ItVlKLp8=; b=Gc2e+LM6ljadkeM7Fli9XeARiF
	ayFxPL13VrYrZ3UwVPDE4WnM4H3BX34B9QkBXMg90x6d/GnqHtN2irxfwudqlJR9Oscmc8y5w0Auz
	/MoxbQ35NYSobJ+ighSxPcpzqIcRZvE1cMLBgBJHh/csV2Y2qVd9FHaqVibelTsQqMok=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfDft-0000j7-EP;
	Mon, 12 Jan 2026 08:53:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vfDfs-0000iy-6j
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 08:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iR5bRUfJYWXaSU9ncyR3oaolwq/uZb/GylTznAhVrMw=; b=gAvViqqy0hDCy4aPBOMWSytImo
 OI7VVM8QRDgnWMK3cpR+VT/xzNtHMa6t7kebeu+LsujuugsG6758xBFIDskq619nAmFYOadLeAIch
 PQRRWjKdz2RZ6OyutXgxx9USiFEj6NRKkDIOeVhaikK+yhC4suNjcnUNYmmV4uK+uBwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References
 :In-Reply-To:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iR5bRUfJYWXaSU9ncyR3oaolwq/uZb/GylTznAhVrMw=; b=UcOWE2sniU29VhrGrJqzVyJTVM
 H8kFx7co3G4nzQe97Lo1BthXK5xPtQSkMg9WPglISSBNIgpnF09/jHOkv+F81DsHJnPcYqZs0Cvvy
 xgzyBYb0Lki4NfAzuhK/xA+jnqhJvdNRryRZ5gseNKYAZ3IWtS2cU8egQgp1euNQvMek=;
Received: from m16.mail.126.com ([117.135.210.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfDfq-0007Pm-NO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 08:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=iR5bRUfJYWXaSU9ncyR3oaolwq/uZb/GylTznAhVrMw=; b=O
 ns10gPPFU8QktfXlUVwKR7l9aH5q+l1lnUt8kVXQaZTTJFgZ8Wo7XfoerTyokSIw
 xy75RHrDP7Sodu3Ci/bUOWDPBOPkkij+tGJKpi6Z9t/HOOd3ruZhMIw+LpJKe1HW
 P3xcaIt1iiTMvF3JSvnAwhYyapmYJDMPIdWujvRNoo=
Received: from nzzhao$126.com ( [212.135.214.5] ) by
 ajax-webmail-wmsvr-41-111 (Coremail) ; Mon, 12 Jan 2026 16:52:53 +0800
 (CST)
X-Originating-IP: [212.135.214.5]
Date: Mon, 12 Jan 2026 16:52:53 +0800 (CST)
From: "Nanzhe Zhao" <nzzhao@126.com>
To: "Chao Yu" <chao@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <0aca7d1f-b323-4e14-b33c-8e2f0b9e63ea@kernel.org>
References: <20260111100941.119765-1-nzzhao@126.com>
 <20260111100941.119765-2-nzzhao@126.com>
 <0aca7d1f-b323-4e14-b33c-8e2f0b9e63ea@kernel.org>
X-NTES-SC: AL_Qu2dCv6buEEs5SeQY+kfmUgRgOw3XMSyu/oi2o9UO5FwjDLjwRsMZHpGDETu+umrJzuojyeoUiJT2OJdb6ZCY4wQcJ9J+riUUVsG47H+5gMBKg==
MIME-Version: 1.0
Message-ID: <13c7c3ce.71fa.19bb1687da1.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bykvCgDH56pmtmRp9DFDAA--.49576W
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsQY6CmlktmY-GgAA3-
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  At 2026-01-12 09:02:48, "Chao Yu" wrote: >> @@ -2545, 6 +2548,
 11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 >> } >> trace_f2fs_read_folio(folio, 
 DATA); >> if (rac) { >> + if (!fol [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
X-Headers-End: 1vfDfq-0007Pm-NO
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: add 'folio_in_bio' to handle
 readahead folios with no BIO submission
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


At 2026-01-12 09:02:48, "Chao Yu" <chao@kernel.org> wrote:
>> @@ -2545,6 +2548,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>>   	}
>>   	trace_f2fs_read_folio(folio, DATA);
>>   	if (rac) {
>> +		if (!folio_in_bio) {
>> +			if (!ret)
>
>ret should never be true here?
>
>Thanks,
Yes.Need I send a v3 patch to remove the redundant check?

Thanks,
Nanzhe Zhao

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
