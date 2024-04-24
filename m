Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4ED8B08C5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 13:55:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzbE1-00016m-Qn;
	Wed, 24 Apr 2024 11:55:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@redhat.com>) id 1rzbDz-00016e-IL
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 11:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=shY7D2Xkj39HblvBkB6u0hIcRZjO+25LFPaiz5EXkkE=; b=PtgWoNt8gFjMHMjto+t2MsFbzl
 oIFI1a+CFBR5f6In2+pKm5DxDy8L2ucoho6jFzzRbf6yzHAzKVh/orJfIGmxu3fP8dwgdbCPcfK43
 qanavu5A3SbLr1AOFQbwPzuFJGQGaudp7Lh1NAg4cBhV+h7bw43ZBb4a5lrkcmOwHFSk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=shY7D2Xkj39HblvBkB6u0hIcRZjO+25LFPaiz5EXkkE=; b=RVBt1u4gvUC8HfXc5OmFzC+6se
 OhvO4MFFh6H/BJETZTG5Nk4vhC8UDaEqtz4y4YypKeE90DRjgmkdwdfgoWENbOfAlqznwuaL4+lWG
 vHE0wd9CGFiEPra/rPqtcGs1wJGQjjHeiNzh1+MR2WQOSvStYcmUJeN9hlqM1dlEpKFo=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzbDy-0006QM-8a for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 11:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713959736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=shY7D2Xkj39HblvBkB6u0hIcRZjO+25LFPaiz5EXkkE=;
 b=itiUPYTzLBSbENgYhsgIkTSUJ4d+AUVwaU12GMPcX5NsoD5ntwpjnxs7zV7/KQ5Zno4g+s
 Noy2fB3HqfW+c3Q/dWkGNX77RX3etRbP60X8mDO3eEU0MNHUNSQqWLwuVyeHZaFnvvBx71
 3VUVtzer0TmzSQlAeFK4XRCr6Z5Uo/E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-dWx4RPLLNtKwr3tuqHK2OA-1; Wed, 24 Apr 2024 07:55:35 -0400
X-MC-Unique: dWx4RPLLNtKwr3tuqHK2OA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-34b5bece899so1535322f8f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Apr 2024 04:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713959734; x=1714564534;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=shY7D2Xkj39HblvBkB6u0hIcRZjO+25LFPaiz5EXkkE=;
 b=t0JaVj2yTekkBI17QvrjttpK057UPzQLkin9QXfxIHa9lqS0k3jfKFtkZ17//VgIZN
 0Ga9XLZhP31ktK+4N3T4NnvYQQc3enmwxekghCQZYckH8yXKkpRFAHx2/XdLvYtTISwi
 CgL5BSITL/R9DhJ+3p50Oq9b4Fnw/1sr33Brd6yZrGstDiZq9svTznKvk/Nss+8z1YYp
 aCoy+aY1w93OzKpRpRifDnr0m+S07W35SD+8QGTrsrL59FhHeFWKIbnVZuZX61/QcOm5
 yLa5q02XCnj4ami8HOqC/lT3CU5YhM/hf0agDVE6vhWGRzaL+YweWp6NtiW2CznlP9Y2
 yFvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkGK2PboH32+aAJDfNdX+APExEezs0jz+vNjIxvhLqbaKA9pf2GLLQKapqjewqQmikCyGdFRUxyYhEJN9JfEaH2I9lAFlKrKBHtDbbiFHP0ftIZVzcSQ==
X-Gm-Message-State: AOJu0YwNAFOXrfruFKygTx38SN4GgE+dFs47/4RpAYRrhnlPqwS45FnC
 EbWMhBVeJxO2wzMsvkyldciO4jGx2Zrt9HJ85vHt5cDNii+ScKkDpH/NJ7qJOh0vCZROoVmoT91
 SuqFb/r5MF8lyNLykODmzT1dYmg80hoFO/sjqWa501G4Ox4bLPeJeR7u++bHu6NoOudniv24PSl
 Us4vWC8tU=
X-Received: by 2002:adf:f404:0:b0:343:a6fc:b2e8 with SMTP id
 g4-20020adff404000000b00343a6fcb2e8mr1528180wro.26.1713959734283; 
 Wed, 24 Apr 2024 04:55:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHra7RXL6CvmI80rpOQzWmziqfED09Pw5xpeVTp+VRYu0eXdYaseI+50tOqQTeJA45mfepL4Q==
X-Received: by 2002:adf:f404:0:b0:343:a6fc:b2e8 with SMTP id
 g4-20020adff404000000b00343a6fcb2e8mr1528165wro.26.1713959733807; 
 Wed, 24 Apr 2024 04:55:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70d:1f00:7a4e:8f21:98db:baef?
 (p200300cbc70d1f007a4e8f2198dbbaef.dip0.t-ipconnect.de.
 [2003:cb:c70d:1f00:7a4e:8f21:98db:baef])
 by smtp.gmail.com with ESMTPSA id
 t14-20020adff60e000000b0034599eca6c9sm16971570wrp.41.2024.04.24.04.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 04:55:33 -0700 (PDT)
Message-ID: <7c52ae2a-8f72-4c3c-b4b3-24b50bdb5486@redhat.com>
Date: Wed, 24 Apr 2024 13:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
References: <20240423225552.4113447-1-willy@infradead.org>
 <20240423225552.4113447-7-willy@infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240423225552.4113447-7-willy@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 24.04.24 00:55,
 Matthew Wilcox (Oracle) wrote: > All callers
 are now converted, delete this compatibility wrapper. > > Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> > --- > include/l [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rzbDy-0006QM-8a
Subject: Re: [f2fs-dev] [PATCH 6/6] mm: Remove page_mapping()
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 24.04.24 00:55, Matthew Wilcox (Oracle) wrote:
> All callers are now converted, delete this compatibility wrapper.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>   include/linux/pagemap.h | 1 -
>   mm/folio-compat.c       | 6 ------
>   2 files changed, 7 deletions(-)
> 
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index b6f14e9a2d98..941f7ed714b9 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -399,7 +399,6 @@ static inline void filemap_nr_thps_dec(struct address_space *mapping)
>   #endif
>   }
>   
> -struct address_space *page_mapping(struct page *);
>   struct address_space *folio_mapping(struct folio *);
>   struct address_space *swapcache_mapping(struct folio *);
>   
> diff --git a/mm/folio-compat.c b/mm/folio-compat.c
> index f31e0ce65b11..f05906006b3c 100644
> --- a/mm/folio-compat.c
> +++ b/mm/folio-compat.c
> @@ -10,12 +10,6 @@
>   #include <linux/swap.h>
>   #include "internal.h"
>   
> -struct address_space *page_mapping(struct page *page)
> -{
> -	return folio_mapping(page_folio(page));
> -}
> -EXPORT_SYMBOL(page_mapping);
> -
>   void unlock_page(struct page *page)
>   {
>   	return folio_unlock(page_folio(page));

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
