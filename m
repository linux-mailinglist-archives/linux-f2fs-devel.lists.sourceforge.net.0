Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBK/AGVVGWqYvAgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:59:17 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 510705FFA1A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:59:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USXdw9sQMnqFf8OzsnvjN7RJsdx+3qeGkyyReFidGZA=; b=kkejDuXW1hSukeBiD0xSnePFVd
	PyQhAHEokLdXKL8uOMxbFHbECEtyO5alWhkWScnKDxUHb3eyv1ORUJ+BL1XS2jyBOFxixl0XbYsqg
	aiGKiacDF2rdPd24ORtNl+Vty21Xdrv/lm62y/232HjwmjDNfH0g2TtTTTZ27vEVtkc8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSt3g-0007V4-Mz;
	Fri, 29 May 2026 08:59:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1wSt3e-0007Ul-Lm
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gZ2cZAa3qsYv2bi3Gm/IDhB9pcQHr57/fM8cDrL7NEs=; b=W4L/VTszgwZJAA8QAaZOmlqS/+
 tzTtySxd5HUkyx+srJ8nNp7ZWXry+eDtetmC0XP2I9M1PSsmVtQEQsVvMGCIRtqkiOzWBLS1YTVPY
 93lUt+t0BTkGlupuzQiwKP/kbeKNiezUwGfa335aJKvrAJ6NfLtQx/HHIAabmMFjCh04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gZ2cZAa3qsYv2bi3Gm/IDhB9pcQHr57/fM8cDrL7NEs=; b=Dm0WFnjW7tKcQrJCz4muQBGBdG
 a/AS+t2ie6O4AdNWoIjUdnbr3V9f/SFTPe72+3kBTJt5hZG1Lww/UtNuWjc/TZrXRbXqx+AxHDbqk
 sYWneAkUoBPRP0gGFPXSvd5YYgSUdKB+2PivXM4ZJKk2DuexWTXt3wD40XQ3JuMGHiDk=;
Received: from mail-pg1-f174.google.com ([209.85.215.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wSt3e-0001Rb-Gk for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:59:11 +0000
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-c85725ce182so260200a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 May 2026 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780045140; x=1780649940; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gZ2cZAa3qsYv2bi3Gm/IDhB9pcQHr57/fM8cDrL7NEs=;
 b=fCBJanHJ+uUS8y/Iy88aAdqqLZTru+QbltZKjWyoXStWs5+5Ma/9Shb+XmXJ/HHS1F
 UX3hfwpygF13tQho7ZA9mppqfbJQKZJafYiWGV5eUnegFnxq9FWHXfsOaPAG7gABPs5a
 7UQ1mybHhj7SjMUC4xFIC7n4XnBZPgfANUUcP8N3TdqE7801v1yaLudP1AZksZ3dAIfk
 MsPZm3G1VZs2SCHHvSBpiYoG9ne8iYb1TdZzJQFLfjmLQZGBxb848RGhHFkZcLz5sKkF
 01KeV13c0qIfW2yF6eElcG9JtuUQPenwHJ3w2seIBLOOc75oiKC/EPZFAQH0UaYdPWzF
 RVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780045140; x=1780649940;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gZ2cZAa3qsYv2bi3Gm/IDhB9pcQHr57/fM8cDrL7NEs=;
 b=X7CdM5T7XFp2JsoelSeneLq979gTjTQC/B0XRvKfkg1dIHbp7rR/eycJqQ1Yl2z15C
 1BrPp+dDRscXQIEy62KWF/ZCCbLJ9rCBdOlakK14Ix7QC1Cg6ppaJKqXtpFYU5soybDa
 rgxa7vl3/mwahtjb93o60+KcKb2GvK39+atdD85LG5DmVjcDMEERzxoN+ST5VybZwvVm
 sKaP139m3tTUhiwJhoq76+0jRd3xp5A2NSX51GBRAO474oPLhmBMELzEFRIx7vUCRe5I
 Ealf0/fIEZehr1YnHqxDuU4X8g7hBizG2FQtzcb3ggA7Ux1klK0IQ0v/wNP2yU14oFjc
 VY7Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+DoRCw9rpXjO2D0U6UI1AJIdlaXokBeprs+LWLb2FVUSoB/Kx1pA+Hz0HnzJLHevCQcPGLjesV0ZdDEk2M32E9@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyG3hpZegWDWhJdj42TFhgojqknaeRreGZPSFhiNZcmLw3oVzDC
 Ezi+3tXmqemrLtjzME+MgRZx7fwOpj9CSqFhHEn7MrcdNtIGTxlt7Tz2jGdoIg==
X-Gm-Gg: Acq92OGgL6T2hkkCCv9D+MBSmlE/Csjsdu18N9bI9tDr8xY1KRNBEGafK+6L86YBa5v
 kGRYP1wOKp5Or4Ope7iR/PBvm20Cvfqnly+j2X/FOyBQ0pWcMBS5yda6DdMXpG0Qk0IfLBQvy0A
 k0SXUF+uOTOB2FXah0Zgi3yaKZEfc8NOXVv2vwsGfDqfnqJAL9KHB7R50cbMLi6pg+kdsff6Jhz
 ASw+ZeTzSoYU7Qqzh7IgAN7CiSPx7NFb/PiFFJDZzfTNPsWIygu2jMP8EwX56OVdME5wcn84KaZ
 3y88AjL5M9qOLsmXjuCEM6maHjxheTAAJZNLOcWzKx3FTT/Ir0sBSmukOC3QOBxJCmFzxJmP9HH
 d8mQ3bV45jwrbe9I3LQsJoRq1ZrGF1E++PYC45OEqsj4kJN7jOZS+cwwNDIEJ1ztuIcfEtx9I8i
 BxexlO+dTilZBM3YOEW787TkSNSQoE/RrfTgVWuRnjU7yR15LDJI1/
X-Received: by 2002:a05:6a20:160c:b0:39f:94cb:1bc with SMTP id
 adf61e73a8af0-3b411d47876mr2295247637.1.1780045140205; 
 Fri, 29 May 2026 01:59:00 -0700 (PDT)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85770b9e2esm1119341a12.0.2026.05.29.01.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 01:59:00 -0700 (PDT)
Message-ID: <6222a7e5-18b0-4318-90aa-676d57258a36@gmail.com>
Date: Fri, 29 May 2026 16:58:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260522082013.3716237-2-monty_pavel@sina.com>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <20260522082013.3716237-2-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/22/26 16:20, Yongpeng Yang wrote: > From: Yongpeng Yang
 > > The following scenario can cause fiemap to report incorrect extents:
 > > $ mkfs.f2fs /dev/vdb -f > $ mount -o mode=lfs /dev/vdb /mnt/ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wSt3e-0001Rb-Gk
Subject: Re: [f2fs-dev] [PATCH 1/5] f2fs: fix extent merge failure when
 largest extent is not in rb-tree
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,xiaomi.com:email]
X-Rspamd-Queue-Id: 510705FFA1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 16:20, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> The following scenario can cause fiemap to report incorrect extents:
> 
> $ mkfs.f2fs /dev/vdb -f
> $ mount -o mode=lfs /dev/vdb /mnt/f2fs/
> $ dd if=/dev/urandom of=data bs=4K count=874 conv=notrunc
> $ f2fs_io fiemap 0 1000000 data 1
> $ shrink all extent
> $ dd if=/dev/urandom of=data bs=4K count=150 seek=874 conv=notrunc
> $ f2fs_io fiemap 0 1000000 data 1
> Fiemap: offset = 0 len = 1000000
>         logical addr.    physical addr.   length           flags
> 0       0000000000000000 00000002868d4000 000000000036a000 00001000
> 1       000000000036a000 0000000286c3e000 0000000000096000 00001001
> 
> The root cause is that when the largest extent is not in the extent
> tree, mergeable extents are not merged, causing f2fs_map_blocks to
> misjudge and output an incorrect extent list.
> 
> Fix this by allowing the extent being inserted to merge with the largest
> extent. When updating the extent tree range, if the new extent can be
> front-merged or back-merged with the largest extent and the largest
> extent is not in the rb-tree, merge them before the normal lookup.
> 
> Fixes: 429511cdf8b3 ("f2fs: add core functions for rb-tree extent cache")
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>  fs/f2fs/extent_cache.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 61f6b9714366..aa368a01b035 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -702,6 +702,27 @@ static void __update_extent_tree_range(struct inode *inode,
>  		__drop_largest_extent(et, fofs, len);
>  	}
>  
> +	if (et->largest.len != 0 &&
> +			(__is_front_mergeable(tei, &et->largest, type) ||
> +			 __is_back_mergeable(tei, &et->largest, type))) {
> +		/* 0. try to merge with largest extent. */
> +		en = __lookup_extent_node_ret(&et->root,
> +				et->cached_en, et->largest.fofs,
> +				&prev_en, &next_en,
> +				&insert_p, &insert_parent,
> +				&leftmost);
> +		if (!en) {
> +			if (__is_back_mergeable(tei, &et->largest, type)) {
> +				tei->fofs = et->largest.fofs;
> +				tei->blk = et->largest.blk;
> +				fofs = tei->fofs;
> +			}
> +			tei->len += et->largest.len;
> +			len = tei->len;
> +			end = fofs + len;
> +		}
> +	}
> +
>  	/* 1. lookup first extent node in range [fofs, fofs + len - 1] */
>  	en = __lookup_extent_node_ret(&et->root,
>  					et->cached_en, fofs,

ping


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
