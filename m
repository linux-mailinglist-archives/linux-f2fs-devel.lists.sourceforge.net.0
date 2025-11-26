Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD3BC885C7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 08:13:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzoKm10STrS6748eB2PhZDfETJwiSafhJvBBw73basA=; b=WAjyN8bLp1ULFgkEiZMC8oYk5i
	sZczap8LfY6wHQghr2ombGS+zYE95Xh3cMR5+jutOJwuSjtl982gtPieKmwxmwK16vGPUcvb1dtGV
	Ns19IFLlsN7knOx6jFUqTwvFy5HdYy5KTtyD+AC3RQTFV5qx3dQS1iOMpQ0GvUbosnXQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vO9i7-0004mE-HR;
	Wed, 26 Nov 2025 07:13:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chaitanyak@nvidia.com>) id 1vO9i6-0004m6-Aq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 07:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WNB/x2UZ7Tj9t8UsuaiaR4gzlQcVC4bLvg/QEEQ8+zE=; b=B+wNCiJ4QK3lWIZdMCMSNHduIC
 MEp6LqSzg+2om/Fa7FMlCaxjEKKu/a8W3hRL7edprPNy0iL8aG+PSYL/QzN0OBcs4RJN5qdMFXmSQ
 +V883UnJffxeSjEobdslMqMJ1jKItR/0di0FfFeFwlo/j4zlFQaXnMbD/Ax+wo7YaqZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WNB/x2UZ7Tj9t8UsuaiaR4gzlQcVC4bLvg/QEEQ8+zE=; b=M4XaYhHNJc9vkVbd6eOA5qFKq1
 ctQPf6EfbuhXcdkkcL8DQZK5oJytNXMpmpxzFlEGQJDE4nyf4ljSrnJhWejjhxyLyHmvu+zwhJtL/
 bIRk4OqeRZbhGtiFLTMJO0VkJMJTY6YOT5+bc1IxeBsVCYLfso33Y405LV0sMi0qxYFI=;
Received: from mail-westusazon11010031.outbound.protection.outlook.com
 ([52.101.85.31] helo=BYAPR05CU005.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vO9i4-0000cB-Ta for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 07:13:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6HalFCwHRKtzatbkEH0IU05YBwMZVrhs4G9kYyOr+37vueN95qLXnCJcqqJ/+ComgnLWW/2cqVJT+TT4kFBP9sW2EK++nEfQZCkWAu9+VtjiaLVYDqoqp+LoRs6UdLHY7ETpdQFPiiJZN3U9OMcfow2UflVyP1ybDoZAU/6TUJcw7kTfvbZJwoWYXflu6vuWiyRn+YRKfuoqI+xjMmJYo4qCz2ua8N7+5zz47psaMDDJaQ/GwwlF47Ut/iAv/7Kp+X6iv/BcKuR5/Jfzkx2fUI0EWSZvNlUEk0GukVMaLYs3G6hIFPkvezM89h2QZk3JMfZdSomqZxjlN7MYhM5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNB/x2UZ7Tj9t8UsuaiaR4gzlQcVC4bLvg/QEEQ8+zE=;
 b=ZD4b2VSozi1TTJeowGEjdjhXff21wYxUt+e38yVtcsz0ckxT5zXPtyqRQELgos9I3XRTLJA+aU7k49K0u3XPUL/WE6gvVVz2QIC0EEcxz5i+k3hEmYGxkh2NUS5Bgih2GBHSyK1LX9I3G2mb6Ssz7M8Es9EbOv5POu5w5IKEr/zk0d5la+3lyDXd47PjOPd3FJOXhrVNYRCXy/U97/5L8UuAaiKNYMPhvhPc9Gmru5mp4Z3EPxy1T3O/iwAMvJefsucqrZpBWQiVf+pHPVeuMDUcun1kG5BpXnrCD5d0Aaot1JMbjyvL5Q6OvRuvqEYkm3DFlaetILUbiRpZGtBHqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNB/x2UZ7Tj9t8UsuaiaR4gzlQcVC4bLvg/QEEQ8+zE=;
 b=CgPyoVt0vMRtdGeKGpsMSEbKsHedPF1YuePyzJilj0uU3veBh7nlqmqRK0A7eyoqhkvl4z777wAgo40Cosyta87rcAlz10jS1u0ks6f+UxNYseuuDW7GZnlIvuc0/T8qvVTz8YkKWT1WGPQiuNgyiHIpFaRoSy/9SFaglB0OjEB43y6bxwJ4iM2NcVGNrlcl7ZD2xsppINWpB7k1uHQxsJpVtktLf9JVPiakODwuXKARQnTmYRLnH7L+MDEFrFugyNbj5PFfsm0O31x9K4EkMVmSKE0LYTnVQGwYfKQs5NnEiR0NCBjpE0gfja8ofstSXWIQlPrvjr+2mXZMretf+A==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by MW6PR12MB8959.namprd12.prod.outlook.com (2603:10b6:303:23c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 03:37:19 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 03:37:19 +0000
To: Chao Yu <chao@kernel.org>
Thread-Topic: [PATCH V3 5/6] f2fs: ignore discard return value
Thread-Index: AQHcXZzXmCoF0wg4KkOwIq06KMelyLUEQtCAgAAN5AA=
Date: Wed, 26 Nov 2025 03:37:19 +0000
Message-ID: <820ffbc8-56cb-4f47-9112-2f4a79524025@nvidia.com>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-6-ckulkarnilinux@gmail.com>
 <09e48eba-6f00-455a-8299-8b8bb4122c7e@kernel.org>
In-Reply-To: <09e48eba-6f00-455a-8299-8b8bb4122c7e@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|MW6PR12MB8959:EE_
x-ms-office365-filtering-correlation-id: 73e9fc54-b35c-4211-937e-08de2c9d1a40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Nm1mUG1PMS9SV3RrMWhoZ3JmczhMNE5RbDRZdTlvUFVveFIxY1ArRE5qY3c2?=
 =?utf-8?B?VWdYU2VnYnhiUnZBaDEvcWRDU01lR3J5TS9DOENCKzVOLytNWUd1cStwZkhO?=
 =?utf-8?B?UWMvbWxIS052QVJqczVZYkRvejJzb2RUSDhxU1hUR3lWMEQyM3JGQWx2eFNh?=
 =?utf-8?B?bUhwdWxNaHI2NUJCcy93WkdsRmJDS2ZIQm5UY25uVDNsTWJ1Mnhsakk4cnZ2?=
 =?utf-8?B?NHE4dlBoR1RoaStnekRWT2M2dlJwWFUyWlBkbEtja0ZVa0ppd05NQkRWakhw?=
 =?utf-8?B?ekNtdkhLY3lDeDBocHZBSGJYakYzU3VOcnBlYXlmTGZIRWZWV0FtcFVNNlRE?=
 =?utf-8?B?QXhpNW5DZDY3UkgrME0xVUtONGgzaXEwUkgvclJPVHBFZzJETFoyS21RRm1J?=
 =?utf-8?B?M3NjcndOUUZkTWE0TDJaVnYybzhUeWI3SzgwYUNwRHQrQ0psM2NGam80Q0Zs?=
 =?utf-8?B?U2d5VjlaTTRoUXFvVnl4TXFwZDVqQ2xKdWwwaFI4TDRuc2N0OVRrQmYwWWI1?=
 =?utf-8?B?eG5RQjNQUnRxMXNkaU9KYnZzUlVhQURBaWp2MDBSSjdNSzBPUzJ2cUFqZ3VE?=
 =?utf-8?B?TUNqbXp2Vi9VNzRlMGlvTnl2Y2hOUG1ZUVpoUU0xd01qTXlFaXpJcUh6d2lY?=
 =?utf-8?B?a2JEOWhLWUtCT2Z3N0dwR0E0TWtjQzY4b0dBd0RpaTc2cUEzSldHQlZ6Q0pB?=
 =?utf-8?B?YWFPYVJjL3VKVFBZZ0w4M1NSU2gzL1lpOVB5a2o2WjlFc3lKVFZLZW5DK0x6?=
 =?utf-8?B?cnNCNFJkaXNXWWFjRGFQNlhUTGRpR0J6M0tuUjM1dzlvTEZjbzFLZXQraWxm?=
 =?utf-8?B?VWEyYk9WOFcwdjFKTUhPbW9WUzl2bW5qZmdLZWp0ZnUrV1RMbnlVQ2o4VHlP?=
 =?utf-8?B?S2JIT2k5YkNLcW56N29UTnJCQWlhR1l0YXkrQUtReEphVXFPRUd0MGV0WUlQ?=
 =?utf-8?B?bmxiMDBtNHV6SFN3Z0k0QWtJdjdxWG9tdG9JSjBNcHdzc1F0QmZ4M3NMQTJa?=
 =?utf-8?B?Uis3MnFRcXk0MHVsdXhzSUIwRFZid3phdlI1Q0dBMEgxdjZReWVkSVlYY0o3?=
 =?utf-8?B?bW9CYWhGSlIwdzJrRU9USXVpQmJBRDNrbFlYNzlFbGQ0d3U2cU4vYkp2NTFY?=
 =?utf-8?B?YW1iWVJJT0V6N295RFBIZHBoZkQ5dExoS0txY2c2SXBWb0liM1VLdmhpeXRC?=
 =?utf-8?B?bXFRcm1xZG5rVXJoYjVzeTNEZy95anpWZ1dhczJyUUZaWGIyMWpqdVVNSE55?=
 =?utf-8?B?ZmMvdDBIdGxIU3JVdnBTZDc5Z1JtcHBRd01lZnBJb1VJenlROURibXdCektV?=
 =?utf-8?B?bmZsWGlPbUhqMDlMWEVLam5rL0tBUjg0R2R0a0JXd2RUU3ZJOFJCOTJOZGpx?=
 =?utf-8?B?UmxSc0tlREpnamhyanRXeUE5V1B5MXhjWldmdmdTc0xXbTd0SytwYVB3a1Rx?=
 =?utf-8?B?b0xpMHNtVWNDR1JvaVY0VnljUWFzOWJCSWZVQVFpOUJERFdmNC9ZWWVmRXRp?=
 =?utf-8?B?MVBESXh6Q1hWak94bGo2SlR2OVNZQW5GQ1Y5dzg1RHkxR1FFcjlZak91VVU0?=
 =?utf-8?B?bnhkK3grMXZOUmQyQ3BIVmxvQ1FManVXS2JFeTBjMHNQUVN0RFJaMlVWOVox?=
 =?utf-8?B?SGhXWkxCTmY3OVNuQlU4UmFaQVNsb1VmVFdreHZ3aEJGV1pjTlBuZGVrTEZ3?=
 =?utf-8?B?MUhqQUt4T2NJem5OZldKMHhpemNGM1BhSFBSZWtETnI4TnpIRnVSbmc2MGRk?=
 =?utf-8?B?MUhCcXpSbHhwSjVvckp1QzdVRFFWRFlTWW14cHhzV2tSdVRGejJKS0c0aG9X?=
 =?utf-8?B?RzRrMFdGaDJ1MTBUelVFQ2NXWWlkdWxGVUJ6a1NvVFJCS0lROVVzNTJMNDRm?=
 =?utf-8?B?Q3V6ZzQ2VUFKVTVCZm9Udi9RdHp1SnhUY1YvZWRMNWhnTDdkUCsycGlxdEtn?=
 =?utf-8?B?VldMTW5IYW1TL0hxT3gwN2dZanFLem9KanpPVnpzWlp3RjdQREJoeEI3R0FF?=
 =?utf-8?B?RXdEV2N6NVlILzNaQzVFc2t2c1BQNXQwSGhvMFEvVGRQN0w5K1BtQ1BnTkhT?=
 =?utf-8?Q?5wKw04?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR12MB9404.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWtVdGJaejVsb1gxdzRyUEs5V1pnbHFsSG5vWmsrOFNZQ3pZeGk1UnBRd2hm?=
 =?utf-8?B?WHNNazhiNmJTT2hMQ3RSZWhPRkhOQ0ZkOFZDSDZvOExzQ01LTkNjMTl5OStD?=
 =?utf-8?B?RlAzY20velJHeHA0d3BuK2NsU0RNWjFtRXBMdWJwamZhQTBTandZb05UVWdw?=
 =?utf-8?B?QTZnb2NOQThmaGdDNUlnbGdFb012SE5GRU5oMTZRQytXOTNxaEp6blBVL29T?=
 =?utf-8?B?K2JQSkdUUVJGUnZmWkZoUHNDazFLS09FZFk1YWVDMzR1Qlg1b28zSzZQbm9C?=
 =?utf-8?B?WVRSNUZQdzNIai9mR0JVQUJXS2hxM2g5SmMyY2xLejNBQmF6R2Q1dWpoTlZx?=
 =?utf-8?B?Vkc3NVhFeWdQdGp1Zzd2MHUzbytWNVcyaTAwWnFQcmN6L004ZjRnWk03ekhm?=
 =?utf-8?B?aWNHZDJrL3Y3a01SNEVXVlM3OUFxS1VpQm96THFuVjVBRXVRNzBsM1J3bVlr?=
 =?utf-8?B?VTJGbzh2OHBuVExMdmgxWFZpRGV4NjRLZ3FLSHQ0Um1FblhBNERwVHJyK2Rp?=
 =?utf-8?B?dzhpNG1zbEdTZWZPcGVmSEllSkUwTnBKS2tOUTd2eGtFSUIvSkZGQnJIN3RL?=
 =?utf-8?B?Ump1ZjFCTi9OdkFYYk5yWEpEMHkvRWhXVWlYaHpRZEVNRmp6YkFDMnFYaFh4?=
 =?utf-8?B?SHRWNmJvNjJvb0ZUZjRzcDUya1ZTMktGZEdjdXIwU2FiWllJc2FVaEhxVzVu?=
 =?utf-8?B?dTh3ckJNV1ZOZHRST1pXT2dlUkI5STBpQi84ZXh6eVZhRkRXbk5COHpCN0Zv?=
 =?utf-8?B?YVhISi9udnBjSllKMVkwenBMUDFKUFlsTmJkdkxXUkQyVnVHWVAvZm1XeXc5?=
 =?utf-8?B?bGFQQ0IvdEQ4ZGNiYmN2cVFQeWtaZFpnSng2YWVHUE9qWmNueHIwbTFpckZU?=
 =?utf-8?B?UXNueDVsbEQ0bDE2N1Y3UXB3R1Vici9wNk5YVTdQNStVWnk1dkJrdHRyVFpy?=
 =?utf-8?B?bUozTEhJQzRtOHV6MG42YzNBTS9KL0lYaEpnK3U4dllxSXVyMVoxd3c0dXh6?=
 =?utf-8?B?akxTRUIwQ0ZPaGI0aHp5OTN4cE5UQnNzY1VZRjhERFQrZCs1MzFINkJzcUZF?=
 =?utf-8?B?TkY2YnFaZ2xZTjIxMWxvb2NqQmFjdFVVUkhoYXl1UWcrLyt4QlFkeE5ISGlh?=
 =?utf-8?B?K0x6RHk1bmpnZ3FJK2hQN05mVU5ZRFVLZGswWEZwbG5yL0g5d0VKR3BOd1B4?=
 =?utf-8?B?dW54ZW5wK0xqVDEvT1huWGhaMzhJaE1MUnJXOFBtODdyV2c3U1hnWFIyeXZY?=
 =?utf-8?B?VVhDQ2lzS3R0ODhsRU9iTDNkalpGdTFHamNwMm11YUx0QlE0SGdsVlFiNmVY?=
 =?utf-8?B?dHZ6WFZFQTZWY1BoRlZmWHdCd2J1SFR6VDM0dHdRcnVFTVBEU2dUU3Nqek5C?=
 =?utf-8?B?TEJxVFRoem50L2ZGZVFYU095azMrTjVjV3NrZThjbjBOc1NscjFzWjQwMGlR?=
 =?utf-8?B?VzNRZFFhT3BtN1BuY1BiRU1Sbk1kRVB0cCs3bWxYMjRSKzJRYzZzU01QZTRj?=
 =?utf-8?B?Zk1md1ZCaGZjeGY3dmo0M2ZiZmw4bmc2WUFSallPWGZBT0VySEtpWlczaVdH?=
 =?utf-8?B?QVVKK09wR3hZL1NTTVBNL1h0dlRmNVZMbm5PYjkvSHhCbGVBZEx4MFpMTk5Y?=
 =?utf-8?B?VVlucjlIZkVGa3FyQnBmbGdCeGdaUHVQMW1GVUp5WmJYeFVOdjc0b1dNUGFv?=
 =?utf-8?B?Wkl2aXQ5WkNKZ1ZuWWlOZFc4c2w4cGhVcUI2bEhaU0kzMkRsb1NFNkFCNmNF?=
 =?utf-8?B?L3dVNkQxLzl6NSttU2ZBWjJOUFJrM3EzeW9ZQktXTDNLRVF0Nlgvckk1dW1K?=
 =?utf-8?B?disvaDE3bUxXbDJtbTNNcnBNSVJTdmNFV2k3Z0xZTERwOUVydTMyT1JaK2Ro?=
 =?utf-8?B?Z280Q2tNQzc3M3ppSncySnV0K2tQRnNheWlQbmlwa2ZwclJFZHhJdXY4V3Fs?=
 =?utf-8?B?WGhGY01RMitGQTZrd2NDN0dXbllabGFlZVZxUGt5ZlNoRDd2b3ZwWUdhT2ZW?=
 =?utf-8?B?ZjNvalkzTjhBaDJKVnV6bmVqdEFrdzN0b00rWG1qRXptdTkrbGtVdm1GR1J2?=
 =?utf-8?B?WHNQZEtXNlN1NENhYk9IUVJoQk1VVVFEK2hOakNKUmo3QVlKUWd6U3RhOGJa?=
 =?utf-8?B?QnVqN2dDeGpmN2dEclNUUkNVa2pvMVhWNFJwZ3RFOGlrM0VNOEtDMDJUcS9Y?=
 =?utf-8?Q?uPb4wJmBKZ/EATaAbhsaUL3oWrPx+yBmmFqYtBLlCVla?=
Content-ID: <28F68F3103F5BC449EB1FFE745677DAD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e9fc54-b35c-4211-937e-08de2c9d1a40
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 03:37:19.4648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c6l5T1zPk/9RgMWdR4AG1EEpJGnw/L51Anmfo7A98TogefJ79JTd2koO91JKi0/Rk9z2DJ3zei4bSqVrfZ478Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8959
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/25/25 18:47, Chao Yu wrote: > On 11/25/25 07:48,
 Chaitanya
 Kulkarni wrote: >> __blkdev_issue_discard() always returns 0, making the
 error assignment >> in __submit_discard_cmd() dead code. >> >> [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.85.31 listed in wl.mailspike.net]
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vO9i4-0000cB-Ta
Subject: Re: [f2fs-dev] [PATCH V3 5/6] f2fs: ignore discard return value
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
From: Chaitanya Kulkarni via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc: "cem@kernel.org" <cem@kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "song@kernel.org" <song@kernel.org>, "hch@lst.de" <hch@lst.de>,
 "agk@redhat.com" <agk@redhat.com>, "sagi@grimberg.me" <sagi@grimberg.me>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 "snitzer@kernel.org" <snitzer@kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "mpatocka@redhat.com" <mpatocka@redhat.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "yukuai@fnnas.com" <yukuai@fnnas.com>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/25/25 18:47, Chao Yu wrote:
> On 11/25/25 07:48, Chaitanya Kulkarni wrote:
>> __blkdev_issue_discard() always returns 0, making the error assignment
>> in __submit_discard_cmd() dead code.
>>
>> Initialize err to 0 and remove the error assignment from the
>> __blkdev_issue_discard() call to err. Move fault injection code into
>> already present if branch where err is set to -EIO.
>>
>> This preserves the fault injection behavior while removing dead error
>> handling.
>>
>> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
>> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
>> ---
>>   fs/f2fs/segment.c | 10 +++-------
>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index b45eace879d7..22b736ec9c51 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -1343,15 +1343,9 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>>   
>>   		dc->di.len += len;
>>   
>> +		err = 0;
>>   		if (time_to_inject(sbi, FAULT_DISCARD)) {
>>   			err = -EIO;
>> -		} else {
>> -			err = __blkdev_issue_discard(bdev,
>> -					SECTOR_FROM_BLOCK(start),
>> -					SECTOR_FROM_BLOCK(len),
>> -					GFP_NOFS, &bio);
>> -		}
>> -		if (err) {
>>   			spin_lock_irqsave(&dc->lock, flags);
>>   			if (dc->state == D_PARTIAL)
>>   				dc->state = D_SUBMIT;
>> @@ -1360,6 +1354,8 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>>   			break;
>>   		}
>>   
>> +		__blkdev_issue_discard(bdev, SECTOR_FROM_BLOCK(start),
>> +				SECTOR_FROM_BLOCK(len), GFP_NOFS, &bio);
> Oh, wait, bio can be NULL? Then below f2fs_bug_on() will trigger panic or warning.
>
> Thanks,

That will happen without this patch also or not ?

Since __blkdev_issue_discard() is always returning 0 irrespective of bio
is null or not.

The following condition in original code will only execute when err is set to
-EIO and that will only happen when time_to_inject() -> true.
Original call to __blkdev_issue_discard() without this patch will always
return 0 even for bio == NULL after __blkdev_issue_discard().

This is what we are trying to fix so caller should not rely on
__blkdev_issue_discard() return value  :-

354                 if (err) {
1355                         spin_lock_irqsave(&dc->lock, flags);
1356                         if (dc->state == D_PARTIAL)
1357                                 dc->state = D_SUBMIT;
1358                         spin_unlock_irqrestore(&dc->lock, flags);
1359
1360                         break;
1361                 }

which will lead f2fs_bug_on() for bio == NULL even without this patch.

This patch is not changing exiting behavior, correct me if I'm wrong.


>
>>   		f2fs_bug_on(sbi, !bio);
>>   
>>   		/*

-ck



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
