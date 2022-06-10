Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53764546360
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jun 2022 12:17:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nzbiB-0005wv-BD; Fri, 10 Jun 2022 10:17:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <david@redhat.com>) id 1nzbiA-0005wp-HJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 10:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ekvjf5YPr7Sjtvmnh5pMqvNXgm63w4q321GSzdMpiws=; b=D4qcMDpV4MBGKQegBF88duaxUq
 yy7mJFfBTVQItAazLcaVHBvmHae73Xdr7Cf5Neo2CeXkzWhM6aFa4WB3A2eeFmp3bLK5r1oVbVbOk
 P5I6j4HHqRnN6SYthrcWlSW2+mVTCKeRS8UkIg0Px/8dRpHDlKugF7+uouhhaLmX/t3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ekvjf5YPr7Sjtvmnh5pMqvNXgm63w4q321GSzdMpiws=; b=MTk7O64WUqd9uSQ3HmRlvKHWVm
 p7zCWAciujJ4T5J3YDUt5x9u5NhVoL0iWZiAUaOc8JTvi9nCXAWTTH3U98x3t1epht5ThnGvF9/Wk
 7sevV8ru+pVatALQ4eDXV/W/2zRZGtepx6nO9V//LuNki751PFdPDuJdP9AA9FsT+rRY=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nzbi2-0005aq-NE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 10:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654856257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ekvjf5YPr7Sjtvmnh5pMqvNXgm63w4q321GSzdMpiws=;
 b=R422DQNibOldKWlgmARWqJj/jnBflxYGCJ34dPCeAmqGiPs+R8ZIsaALOJs26KSF7i5shV
 8c4iGAzs36ZifLrsLUUvTTYBlEKMNjAuWAXnLpu9z/IiIszg0EPqkub8BmaIO/xtiimXrM
 E/8YUE26JcZOBvyiHFzLj8IJXPCzQcQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-tZUYuCpXMSuWRHTkCWfjOw-1; Fri, 10 Jun 2022 06:17:36 -0400
X-MC-Unique: tZUYuCpXMSuWRHTkCWfjOw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k34-20020a05600c1ca200b0039c7db490c8so687035wms.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Jun 2022 03:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ekvjf5YPr7Sjtvmnh5pMqvNXgm63w4q321GSzdMpiws=;
 b=zR8mh5R+1B3e+Mycb98XAKqR9fKh01VZYYhU9pWyapbxZA+64QhcFuwl5g5fKE1sF0
 DMOJmSJJomX8EX4ztaciZTwnxUeDDKxBU7Alphxr/QPrzxmNe/xD//UKe9Q/cbcRNFVZ
 /M6+MppXMTd8+ZNk8+WU0B4UU/LHH4mCtsM4CFKIcsk3PHFQ1QDPZNvbDypdei/AgPzk
 621aCVjfPbmPH+FAoC0SK/pPZ3rywV0x0Q8NMYSAmXm/VsIP4VfcqqAMHZIWhJ4HxOhL
 i6MkfTtxJE6tcXNIJt/0Ka+gtj3qt+XRrYWCpBYEXSo6GgtYc7K4tHbB1hGfoCEL8H1d
 gv1Q==
X-Gm-Message-State: AOAM530HObfTFfniAMMQcSGqi2SVjZSMS3exRmPDRsNUVW+yyZK5/0ap
 ksPXu4L9G3ozM21X26Buh+k+InPXCUT6R2Xy2FtD0v+ybqQinHY36uRb7guRs2+BBduc+p81ACr
 OK/KsamtruVCJC8KYyDo2sj6f2Hbqy4bSI3EVYg==
X-Received: by 2002:a05:6000:91:b0:217:8efc:f572 with SMTP id
 m17-20020a056000009100b002178efcf572mr29122726wrx.186.1654856255658; 
 Fri, 10 Jun 2022 03:17:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMoCknlizO69Nl0wuEIzBALIZP/2+KDolU3ne+3dmHgzec6LJk/2XhtTIsrJ35XnXVn7hgfw==
X-Received: by 2002:a05:6000:91:b0:217:8efc:f572 with SMTP id
 m17-20020a056000009100b002178efcf572mr29122693wrx.186.1654856255339; 
 Fri, 10 Jun 2022 03:17:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:1f00:4727:6420:1d4d:ca23?
 (p200300cbc7051f00472764201d4dca23.dip0.t-ipconnect.de.
 [2003:cb:c705:1f00:4727:6420:1d4d:ca23])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c4f5100b0039c4f53c4fdsm3105741wmq.45.2022.06.10.03.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 03:17:34 -0700 (PDT)
Message-ID: <e287a12d-29d9-da69-9315-52414341cbd1@redhat.com>
Date: Fri, 10 Jun 2022 12:17:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Matthew Wilcox <willy@infradead.org>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-4-willy@infradead.org>
 <b2a81248-03fc-afb3-1041-d8206e95e08a@redhat.com>
 <YqIFHPJZNMrmtXlh@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YqIFHPJZNMrmtXlh@casper.infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09.06.22 16:35, Matthew Wilcox wrote: > On Thu, Jun 09,
 2022 at 02:50:20PM +0200, David Hildenbrand wrote: >> On 08.06.22 17:02,
 Matthew Wilcox (Oracle) wrote: >>> diff --git a/Documentation/filesy [...]
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nzbi2-0005aq-NE
Subject: Re: [f2fs-dev] [PATCH v2 03/19] fs: Add aops->migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09.06.22 16:35, Matthew Wilcox wrote:
> On Thu, Jun 09, 2022 at 02:50:20PM +0200, David Hildenbrand wrote:
>> On 08.06.22 17:02, Matthew Wilcox (Oracle) wrote:
>>> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
>>> index c0fe711f14d3..3d28b23676bd 100644
>>> --- a/Documentation/filesystems/locking.rst
>>> +++ b/Documentation/filesystems/locking.rst
>>> @@ -253,7 +253,8 @@ prototypes::
>>>  	void (*free_folio)(struct folio *);
>>>  	int (*direct_IO)(struct kiocb *, struct iov_iter *iter);
>>>  	bool (*isolate_page) (struct page *, isolate_mode_t);
>>> -	int (*migratepage)(struct address_space *, struct page *, struct page *);
>>> +	int (*migrate_folio)(struct address_space *, struct folio *dst,
>>> +			struct folio *src, enum migrate_mode);
>>>  	void (*putback_page) (struct page *);
>>
>> isolate_page/putback_page are leftovers from the previous patch, no?
> 
> Argh, right, I completely forgot I needed to update the documentation in
> that patch.
> 
>>> +++ b/Documentation/vm/page_migration.rst
>>> @@ -181,22 +181,23 @@ which are function pointers of struct address_space_operations.
>>>     Once page is successfully isolated, VM uses page.lru fields so driver
>>>     shouldn't expect to preserve values in those fields.
>>>  
>>> -2. ``int (*migratepage) (struct address_space *mapping,``
>>> -|	``struct page *newpage, struct page *oldpage, enum migrate_mode);``
>>> -
>>> -   After isolation, VM calls migratepage() of driver with the isolated page.
>>> -   The function of migratepage() is to move the contents of the old page to the
>>> -   new page
>>> -   and set up fields of struct page newpage. Keep in mind that you should
>>> -   indicate to the VM the oldpage is no longer movable via __ClearPageMovable()
>>> -   under page_lock if you migrated the oldpage successfully and returned
>>> -   MIGRATEPAGE_SUCCESS. If driver cannot migrate the page at the moment, driver
>>> -   can return -EAGAIN. On -EAGAIN, VM will retry page migration in a short time
>>> -   because VM interprets -EAGAIN as "temporary migration failure". On returning
>>> -   any error except -EAGAIN, VM will give up the page migration without
>>> -   retrying.
>>> -
>>> -   Driver shouldn't touch the page.lru field while in the migratepage() function.
>>> +2. ``int (*migrate_folio) (struct address_space *mapping,``
>>> +|	``struct folio *dst, struct folio *src, enum migrate_mode);``
>>> +
>>> +   After isolation, VM calls the driver's migrate_folio() with the
>>> +   isolated folio.  The purpose of migrate_folio() is to move the contents
>>> +   of the source folio to the destination folio and set up the fields
>>> +   of destination folio.  Keep in mind that you should indicate to the
>>> +   VM the source folio is no longer movable via __ClearPageMovable()
>>> +   under folio if you migrated the source successfully and returned
>>> +   MIGRATEPAGE_SUCCESS.  If driver cannot migrate the folio at the
>>> +   moment, driver can return -EAGAIN. On -EAGAIN, VM will retry folio
>>> +   migration in a short time because VM interprets -EAGAIN as "temporary
>>> +   migration failure".  On returning any error except -EAGAIN, VM will
>>> +   give up the folio migration without retrying.
>>> +
>>> +   Driver shouldn't touch the folio.lru field while in the migrate_folio()
>>> +   function.
>>>  
>>>  3. ``void (*putback_page)(struct page *);``
>>
>> Hmm, here it's a bit more complicated now, because we essentially have
>> two paths: LRU+migrate_folio or !LRU+movable_ops
>> (isolate/migrate/putback page)
> 
> Oh ... actually, this is just documenting the driver side of things.
> I don't really like how it's written.  Here, have some rewritten
> documentation (which is now part of the previous patch):
> 

LGTM, thanks.


-- 
Thanks,

David / dhildenb



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
