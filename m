Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B57A00584
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jan 2025 09:08:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tTcio-0005Vy-HZ;
	Fri, 03 Jan 2025 08:07:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tTciY-0005Vf-KS
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jan 2025 08:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qujmEOlJ3tgcD2nrtY7K3M/4JZoSTVeq0+1Iz64/AYQ=; b=Y5MoQay/ng9LNEcYOcA+OAp0WN
 gvpFLKk798xuy7jtoUaloIpWtWjIda4GkBB/it5bAK4jjPubMFxFKnr9RZRwxhmBOL8EplGVFEXXA
 WsP2pMh8AoCKu8ONZnsp8sYOCNOleJ2PG4YELQyzGRcCt3QfGXtXRfNWue6TU/vxlC2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qujmEOlJ3tgcD2nrtY7K3M/4JZoSTVeq0+1Iz64/AYQ=; b=MNUDw0pIMsOUssIVujCydVVyiq
 WExN8xKw9jhjYOGTNIq1ZIb9NkXuqMxZhf+Hu9sgyHrkPeSbTBkShWnV/ZhSRJKuJqbYV+Qzyuqle
 5T+8pf0QW6S8HK0cYIISi1JQ57q6JbqqzCSxxc+Svph6YUvl8NMF7vJe8VlrdWhu8NQ8=;
Received: from mail-koreacentralazon11013032.outbound.protection.outlook.com
 ([40.107.44.32] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tTciX-0001nV-0O for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jan 2025 08:07:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDqiFe3sXdbz59F5kNgSeYpRe1OZoW4NfzyB4lzoBHXUwgySutCXh4y0EKVTfyfLbIYECsFe7/XJRe0ohMuNCd5qubUav2scPxrq6Zp+Ktc35I8DlkgioXXvmfAsW2oms3e4mGq47Ul+gyHVpYtLjkarjPcVk0ioRkFVL0Fx/BbVVBkrkaWnltgjGjvdhSrgA4nPmVLb16Pf3FKsJLxafvNZE7E9ObOou7M8XBQhwIj2qKhrE209PJuWg50m5g+VCpDnHEOcHTP9LXidlBfWy4xqTORNohH2Nw66BCtsMZQQlo5zQhxjilk3bkRtxYBg/vYyTycO7wZEt1GVF6rFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qujmEOlJ3tgcD2nrtY7K3M/4JZoSTVeq0+1Iz64/AYQ=;
 b=S0BYpQvm41FYpTi8Beew6gT9KzrTocb9Jd+TP9pRM24Z5mcLEjy0BPAwgh26QcjM+GpSrYQ+dA9zCsmdXU+uIUgvuJTakpOX3KcIBZeAAKZfMm+5xWk/YDVM4uaQlIAfrtaspSsmjpFZbDJgEMAeFvgLZ411N3i7MpoHZWH2aqxEvQvWey/bbVDoqYB9GC2+t1Esz1bgrUvKVC0oD0m9KnLcSTjVO4BmWkZtgHTMBmzbk36ToTD7gKs5cKGBWhD3ZmjL4ZdwxFFtYNjSVlhfIcTRxqzaBBeogf1B7VVDvzsofJYMf0llW0ZgkJXyafSxtgoEqh4vSK9lq88wrn1UIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qujmEOlJ3tgcD2nrtY7K3M/4JZoSTVeq0+1Iz64/AYQ=;
 b=QHaFTTLcYiQ6r7GTZvBrHzOzF7azg6NpHgE2Nj3aYo0x4OO3D1ERh60/kA8bzUAYOcT3UFiYusqA1qZxbuPA0TVHByp27gJ/3W5/U37XYEUt+/P93hoHv+laQStG9mb7rCFyhlDBfWtjrj9qCdwBnMBAKzVKWhTYw+5ghoYj582jfok7f+JMy3910cFjLFljuQoakKieijiAVqtrI/Wp7mMjgFl4P5pNeZODIN2TBMA2DDJ8DEgjTfwqHt0Qkny4SpHbicwZEoph1KEKGMn89IeUMZkFjHw94J84/74PgquUU1UDdlGhgQIFFQHjFopWvVFIcjNRLNia3cX0HdaQXw==
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com (2603:1096:405:b5::13)
 by SEZPR06MB5000.apcprd06.prod.outlook.com (2603:1096:101:48::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 08:07:27 +0000
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b]) by TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b%4]) with mapi id 15.20.8335.003; Fri, 3 Jan 2025
 08:07:25 +0000
To: Chao Yu <chao@kernel.org>, Chunhai Guo <guochunhai@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH 1/2] f2fs: fix missing discard candidates in fstrim
Thread-Index: AQHbXPx8oQ8hJSG8D0iyeVcEHNoDB7MEZI2AgABOhYA=
Date: Fri, 3 Jan 2025 08:07:25 +0000
Message-ID: <a4523b96-56eb-4b1d-a031-ec4a67c2c42b@vivo.com>
References: <20250102101310.580277-1-guochunhai@vivo.com>
 <62b14417-1297-4ed6-9ff3-b24115d433c4@kernel.org>
In-Reply-To: <62b14417-1297-4ed6-9ff3-b24115d433c4@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB7096:EE_|SEZPR06MB5000:EE_
x-ms-office365-filtering-correlation-id: 70765f8f-409f-4e95-2bf8-08dd2bcda8aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WldMbW5JMjhwbmRTWGdzblVWUTFScFBjbzhjc09yMnpBU2haTVBWL0draVFy?=
 =?utf-8?B?aWtpbGg3aDNHTkpPTUV5RlZ5WWtiWHVzODRNVVlMK0xLY0RPUnhuNkpYR2Mz?=
 =?utf-8?B?ZFF6VnA2SmhTbmNFMFpmYnMvRE5ZM2RuR0hOdWhnR2w4eFpwNjZMSFpFakMv?=
 =?utf-8?B?Umx6VGphVTNxTlpqMkVOdE1MK2FhS1A5RE5PakJibmUxWnNBbDZXdm1La1VJ?=
 =?utf-8?B?T052VGVnbUxEa0JwcWlKV2VBWmZKWVlqaVEzem16TEF3SERBTlpBYVJ5Z2dV?=
 =?utf-8?B?SVlNZzVJbE9SVEIwYStacXpKbFAvK211QnhrZzMwWXAwTnZrSit5L1JPa3kw?=
 =?utf-8?B?ZnFQOEtGVkJOSzBGYjZhZHVsREpqMlBtZDJVRklNWGNERnFodzREV084aDM5?=
 =?utf-8?B?MXJwNzl5SVlXOWZObjREQVZ4QTRyYjExTlUzOWdPSGZua0w3N01jemV6UnFj?=
 =?utf-8?B?eFVWT3gzQythSTJLOE5kOFVNSUhsdEVhQmNneDhZc0ExZUpza0dCOVFSR3Vl?=
 =?utf-8?B?V3E1eHFMRkppZGFQWkZGWUJabGV2VVRkb0FhQ0ZOUE9TSGZXSDhjS2pCVko4?=
 =?utf-8?B?TFlUb3paNkJ4c0NhVUpFTHcvNVJxdEJKZkk0VFJMS05nN09GV1FmYkxZSklZ?=
 =?utf-8?B?ZEdLZHArbjFxSzIwTUozRmRTS1VSOWVuN1cybUZDTENDNEFyM1M3aWtyRmlk?=
 =?utf-8?B?YThhU3RBS2lrMmF4VE5RcnZrMnBzYlFoUk9HODNQWmp0eE9JME1VbS9CU2gy?=
 =?utf-8?B?aXFWSEFPS211Tm5QendHOGZFV0FJWklSNWthMnlLTlllZ3ZHRUpMNnhOUUx3?=
 =?utf-8?B?dzkyVkZwVDBlMStHWjFOWTI4QklJQ2xDMW9oNTVWNFpDK1BveXpsN0EwVEJB?=
 =?utf-8?B?aEFiOHpBWGdwQWhLUjVFa3I2MWNWejVSdzAyZVJaNXNwMXJTQStBcitEOWJt?=
 =?utf-8?B?QjY2V3VjU0pZaVNOUkx4L0paTkcyakxiRElvWVJWL2pMSUZaNnB3dWZDUXFG?=
 =?utf-8?B?WkFJV04yTmZZb2syUHhxWlYvN3o1TWVqRzJrR1M2dDFDYlJsNmtmdDd4VWx5?=
 =?utf-8?B?Q2xXWHFTemJEZ3J2VkJZMFJUekxvOUFtVTdXOGNBSzBtVGFxU2VFQTIrQ0Vn?=
 =?utf-8?B?MFdEMFg3ckRFQjFPZWU1Q1FzR2NDSnJPOWlsZWQ3REpQaVJhNmFtOG8vZEhZ?=
 =?utf-8?B?eGdacy9Jc2FXSnJXUVVCWWxFakl3bFVlQVVqQXlDY2V6MEpIM1hRVEZZeE93?=
 =?utf-8?B?UTlJWkJwZ3Z5cUZRUlBESWxGTUFFckkzTkllbmh2SitabDBnZzNUa0tXd0pi?=
 =?utf-8?B?L3V4bitrWldvR3NIMzJFRGQ4NUZIWFh3VjBOb0REdTZNWElXWVJ4YlJGVTNa?=
 =?utf-8?B?aDVJREYvUGVaOUxDY2xIdm40cEJ1UldQdFVhelFYa3VJSzZkMmUwUU11Q2V0?=
 =?utf-8?B?cVR1U3E2WjZ4R1MzMktzQ2p3bXRwWW4rNDRVMjZjd0t2dXlBYlVhbWxlTFJS?=
 =?utf-8?B?bDE2UmpZNjZITGdKeWF5UmNCYlAwaW02UGtFRjAwMzA0MDB0VGt0aDZ2STl3?=
 =?utf-8?B?b3dNNGNHZEtKYVQ2cU9HRnpQNkkwTHMwYzNlenJPWWRocmJibXdKN0NzTTFQ?=
 =?utf-8?B?azFLYkVjd3h6eGgvSCtSUnN6VVA2emZXYmhaY0NXR1hOYzJaOUtjREROakRj?=
 =?utf-8?B?YWxwVzBMYTVGdVFsVXBvUTFnWUdwOVhUSVRmSGcxNlp3VXNqTHVhOXZQMkdZ?=
 =?utf-8?B?NFozVUFMcmdxNUNqeTZjWWtZUnFNZ3pWUW85Y3dQdFRHSUxGanUzT0Y1ejdn?=
 =?utf-8?B?bmRjWGprRHlXdFZBUkJYeTgydk9RYS9uTDE4ZDlyMm83OE11ZnEzeUVHciti?=
 =?utf-8?B?cXkvd2xQTlFLMm5RS3R0eUZwUmxpWHRPZWhVZ0RFdVdpdzNLSGhKZHBnTldJ?=
 =?utf-8?Q?q1sdF8nxqPzDM8JtqFTXdIlZQuVm0QYQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:TYZPR06MB7096.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFlrV3FrR1NKaGFkWkZ3UUorL29zNWdiajJzSDYyYmVrT2RNcmJSTG5TUVl2?=
 =?utf-8?B?Q0JRWmVDVjdJbmg4cUw2TGdLbjJkLzJ0RmpLTit1cVZJWkFaM1ZQQm05dDhH?=
 =?utf-8?B?M3lJNWRhelNPRjRNN3pEYXBzQlYrajgwNUFkS1E0VnJtOG95eGg4aWlzRk5F?=
 =?utf-8?B?RmkvTGM4K25VQzVSZlVFWVdGMGJHMG82ZkdJeHhuL3B0QTBTYTlvM08wRklF?=
 =?utf-8?B?K3VlcHY0b21LNDh1QUtDSGswRWZUQmpJVjNoN1dUdnpOQmhOa0dXUHhCT3Jj?=
 =?utf-8?B?UU5zMnNKMFNXSGRrWnk5Zklmdm9OYkYzd1RpKzdiRDlzalVqTFhUU2VsRW5V?=
 =?utf-8?B?SlRGUk9vYllEeEhYTWw5M2ZsbGVWbWhEQ2FVS200d3dBdmZvMkdnMW5VZ3Vj?=
 =?utf-8?B?WUdzUlpHMXBaSzF2ckJ3UGxrUUw0dUxvQkxiY0h2N1hTYysyVlF5d0ROc2ho?=
 =?utf-8?B?QUhEcGozMWtDWExoTXlLV0ZZNUNpeW5XTTFNRlFPZTIxNHFUWmM4K1NuRUhu?=
 =?utf-8?B?ODU1WVMyYTR2cnp4ekw2VVkya2VSMlA4SmZiVkYxVHRDVExuMXFxNUxEUko2?=
 =?utf-8?B?YXBGdHp3SnowRTVCc3JUNGFUSytDRTJnNFZoK1J1REpSN1ZPNGtwTlNYUlFM?=
 =?utf-8?B?TDlqRkduOE9XbElMSnVobHBPSlJVaVdGWHBweE1aUTIyOE1ySzJMdUtVS0Jv?=
 =?utf-8?B?bkF6MEFQYno2T0djMFpzSlVEcEl0WlBTTEJsQTJHZVhqTXFrQ0JBbGVMYUc3?=
 =?utf-8?B?Rms4d0ZaSnBIRnBJR2NnVUpFdis5KzZNV3BCMDdhYnNheFdwdTNrUWlyTjFP?=
 =?utf-8?B?QUpjUTRQOUpKb1krZm4vbUZhb0VBREczWnJQUlVLd3JlSWhTL1I2NUgzSGpU?=
 =?utf-8?B?aFhQWjVvRDdKRjIvSEFHUUhkTzhCaVpDSUxxN2hEb2N4YTEyN1laUys2dnkz?=
 =?utf-8?B?N1V0QkN3QkhIYWFZYWthOXFac1ZrOUxweUdJMnRrQXRDcmlxYUlyOW9SQW1F?=
 =?utf-8?B?VEdtSkZmQU95MnJFaXVjdFcvcUIxYnZzYTQ4ZDUwMkdJNFdNTHhOZGdlKzZH?=
 =?utf-8?B?elNJTUVaSTFTNE8rNHU2OXdDL1A2a0VqTWlZandyaUU1OXhOQnZrb28vakVl?=
 =?utf-8?B?OXRXdmY0Smc2REdTeEdkbm9JNXNLdnZRa3M5bEZmSlhBQ29XdzJaMmtVOUZn?=
 =?utf-8?B?ZnROV0F3Ky8xZlpqelB6M0FQb2tWUEorV1p5VHUxc3BnS2JYaUlIQ1ZmZGVS?=
 =?utf-8?B?UGgwczZLcDFPZEcwTGJLdytEbUVxN1pVbWhmdEVhWTl6VEVPWHM2QjVraFRs?=
 =?utf-8?B?SE1JUC9vSnhGYlFPVmdHNXZXbWQwYW12Vm95Nk0yYW0vWUN5QjlneDQvakF3?=
 =?utf-8?B?bmlhQ00xSmdqSXlPTWE5L0J6NE1sc3NmaU5wWjhvbERDRUlvQjhoQTlZZ01s?=
 =?utf-8?B?UldpWko5dElBMkVSckJPOXdCR01mend1aW9wcUovSnhYS0NhVldTbm9VOWZ4?=
 =?utf-8?B?U2ljTFNJS0czb2p0UjZYa29nNUIrYWxWUmpEUnBPenJjR1YxaHJ1WE54UFRF?=
 =?utf-8?B?ZFdFaTQ4aHN4RVNTMnlMOXhtUHhyaGNaRXVZQmdvSmFST2VLb3VnVjRIS29h?=
 =?utf-8?B?YW4wRS9lT2NScXZwSmxmVmVUeWZYblBmVzBiYnBOVWc4QzhkSldrN1EvZjJx?=
 =?utf-8?B?dkJxUHhyY1YvaUJ0NDk2bFdVMEJZYkdtam5uMHRUUENUS0lEZ0l2YWYrcjhT?=
 =?utf-8?B?QlhSTDVxTFk3bENhMFczbmJ0WlNnS2ZRN2NNMGdRaVNBNDBJamliWWhOTC9x?=
 =?utf-8?B?VUdIOUFTZGJHQ2p3MllaVmpyN1gxZml4SnBGM0xoVThpcEpNYm1PSmpiV1po?=
 =?utf-8?B?cS84VDU2TXFSd1daeTl3VDQ2TFo5Z3B6UjE0dWxiUElFRUd1UDdYbFhnUkMx?=
 =?utf-8?B?Tmhxd1hYZURCcFd6TnQwQ3RpSFI3SFNvYTRIclFGWGVjNDJYTElHUTJMYW1F?=
 =?utf-8?B?a1ZWdDhzSkxoS2hWM1hOSnhDcEh1NjJWdDNVbVU3d1pMVWh1RWRrMUM1S0wv?=
 =?utf-8?B?eTFvWjhZM243b1pzNDVyYjNRQnp4dGRTNkgrL1RHUnFjNHFRZXZLUjBQTStM?=
 =?utf-8?Q?nV8I=3D?=
Content-ID: <47854C4EF815F546AEB4A9E6B9909459@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7096.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70765f8f-409f-4e95-2bf8-08dd2bcda8aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2025 08:07:25.4278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o4XgWPmMV+HUllDsqF9mjTcv/mNGn/KelpwvPlu9YxATX2jjtTbULFMnuNW2d4G4/EpQXK8CRZkUQq846xF2xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5000
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 1/3/2025 11:26 AM, Chao Yu 写道: > On 2025/1/2 18:13,
    Chunhai Guo wrote: >> fstrim may miss candidates that need to be discarded
    in fstrim, as shown in >> the examples below. >> The root cause i [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.44.32 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.44.32 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.44.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1tTciX-0001nV-0O
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix missing discard candidates in
 fstrim
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDEvMy8yMDI1IDExOjI2IEFNLCBDaGFvIFl1IOWGmemBkzoNCj4gT24gMjAyNS8xLzIgMTg6
MTMsIENodW5oYWkgR3VvIHdyb3RlOg0KPj4gZnN0cmltIG1heSBtaXNzIGNhbmRpZGF0ZXMgdGhh
dCBuZWVkIHRvIGJlIGRpc2NhcmRlZCBpbiBmc3RyaW0sIGFzIHNob3duIGluDQo+PiB0aGUgZXhh
bXBsZXMgYmVsb3cuDQo+PiBUaGUgcm9vdCBjYXVzZSBpcyB0aGF0IHdoZW4gY3BjLT5yZWFzb24g
aXMgc2V0IHdpdGggQ1BfRElTQ0FSRCwNCj4+IGFkZF9kaXNjYXJkX2FkZHJzKCkgZXhwZWN0cyB0
aGF0IGNrcHRfdmFsaWRfbWFwIGFuZCBjdXJfdmFsaWRfbWFwIGhhdmUgYmVlbg0KPj4gc3luY2Vk
IGJ5IHNlZ19pbmZvX3RvX3Jhd19zaXQoKSBbMV0gYW5kIHRyaWVzIHRvIGZpbmQgdGhlIGNhbmRp
ZGF0ZXMgYmFzZWQNCj4+IG9uIGNrcHRfdmFsaWRfbWFwIGFuZCBkaXNjYXJkX21hcC4gSG93ZXZl
ciwgc2VnX2luZm9fdG9fcmF3X3NpdCgpIGRvZXMgbm90DQo+PiBhY3R1YWxseSBydW4gYmVmb3Jl
IGYyZnNfZXhpc3RfdHJpbV9jYW5kaWRhdGVzKCksIHdoaWNoIHJlc3VsdHMgaW4gZmFpbHVyZS4N
Cj4gQ2h1bmhhaSwNCj4NCj4gQ2FuIHlvdSBwbGVhc2UgdXNlIG5vZGlzY2FyZCBvcHRpb24gZHVl
IHRvIGZzdHJpbSBzdG9wcGVkIHRvIHJldHVybg0KPiB0cmltbWVkIGxlbmd0aCBhZnRlciBiZWxv
dyBjb21taXQ6DQo+DQo+IDVhNjE1NDkyMGZhZiAoImYyZnM6IGRvbid0IGlzc3VlIGRpc2NhcmQg
Y29tbWFuZHMgaW4gb25saW5lIGRpc2NhcmQgaXMgb24iKQ0KDQpUaGFuayB5b3UgZm9yIHlvdXIg
ZXhwbGFuYXRpb24sIGJ1dCBJIGd1ZXNzIHRoaXMgaXNzdWUgaXMgbm90IHJlbGV2YW50IA0KdG8g
dGhpcyBjb21taXQsIGFuZCBJIHVuZGVyc3RhbmQgdGhhdCAnMCBCICgwIGJ5dGVzKSB0cmltbWVk
JyBpcyBmaW5lLg0KDQpUaGUgcmVhbCBwcm9ibGVtIGlzIHRoYXQgdGhlcmUgYXJlIGFjdHVhbGx5
IG1hbnkgY2FuZGlkYXRlcyB0aGF0IHNob3VsZCANCmJlIGhhbmRsZWQgaW4gZnN0cmltLCBidXQg
aXQgY2Fubm90IGZpbmQgYW55IG9mIHRoZW0uDQoNCmYyZnNfdHJpbV9mcygpDQogwqDCoMKgIGYy
ZnNfd3JpdGVfY2hlY2twb2ludCgpDQogwqDCoMKgwqDCoMKgwqAgLi4uDQogwqDCoMKgwqDCoMKg
wqAgaWYgKGNwYy0+cmVhc29uICYgQ1BfRElTQ0FSRCkgew0KIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoIWYyZnNfZXhpc3RfdHJpbV9jYW5kaWRhdGVzKHNiaSwgY3BjKSkgew0K
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuYmxvY2tfb3BlcmF0aW9u
cyhzYmkpOw0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0
OyAvLyBOb3QgY2FuZGlkYXRlIGlzIGZvdW5kIGhlcmUgYW5kIGV4aXQuDQogwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIH0NCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC4uLg0KIMKgwqDC
oMKgwqDCoMKgIH0NCg0KPj4gcm9vdCMgY3AgdGVzdGZpbGUgL2YyZnNfbW91bnRwb2ludA0KPj4N
Cj4+IHJvb3QjIGYyZnNfaW8gZmllbWFwIDAgMSAvZjJmc19tb3VudHBvaW50L3Rlc3RmaWxlDQo+
PiBGaWVtYXA6IG9mZnNldCA9IDAgbGVuID0gMQ0KPj4gICAgICAgICAgIGxvZ2ljYWwgYWRkci4g
ICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzDQo+PiAwICAgICAgIDAw
MDAwMDAwMDAwMDAwMDAgMDAwMDAwMDQwNmEwMDAwMCAwMDAwMDAwMDNkODAwMDAwIDAwMDAxMDAw
DQo+Pg0KPj4gcm9vdCMgcm0gL2YyZnNfbW91bnRwb2ludC90ZXN0ZmlsZQ0KPj4NCj4+IHJvb3Qj
IGZzdHJpbSAtdiAtbyAweDQwNmEwMDAwMCAtbCAxMDI0TSAvZjJmc19tb3VudHBvaW50IC0tIG5v
IGNhbmRpZGF0ZSBpcyBmb3VuZA0KPj4gL2YyZnNfbW91bnRwb2ludDogMCBCICgwIGJ5dGVzKSB0
cmltbWVkDQo+Pg0KPj4gWzFdIFBsZWFzZSByZWZlciB0byBjb21taXQgZDdiYzI0ODRiOGQ0ICgi
ZjJmczogZml4IHNtYWxsIGRpc2NhcmRzIG5vdCB0bw0KPj4gaXNzdWUgcmVkdW5kYW50bHkiKSBm
b3IgdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHNlZ19pbmZvX3RvX3Jhd19zaXQoKSBhbmQNCj4+
IGFkZF9kaXNjYXJkX2FkZHJzKCkuDQo+Pg0KPj4gRml4ZXM6IDI1MjkwZmE1NTkxZCAoImYyZnM6
IHJldHVybiBmc190cmltIGlmIHRoZXJlIGlzIG5vIGNhbmRpZGF0ZSIpDQo+PiBTaWduZWQtb2Zm
LWJ5OiBDaHVuaGFpIEd1byA8Z3VvY2h1bmhhaUB2aXZvLmNvbT4NCj4+IC0tLQ0KPj4gICAgZnMv
ZjJmcy9zZWdtZW50LmMgfCAxMCArKysrKy0tLS0tDQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jDQo+PiBpbmRleCBlYWRlMzZjNWVmMTMuLjhm
ZTlmNzk0YjU4MSAxMDA2NDQNCj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jDQo+PiArKysgYi9m
cy9mMmZzL3NlZ21lbnQuYw0KPj4gQEAgLTIwNzAsNyArMjA3MCw3IEBAIHN0YXRpYyBpbnQgZjJm
c19pc3N1ZV9kaXNjYXJkKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwNCj4+ICAgIH0NCj4+ICAg
IA0KPj4gICAgc3RhdGljIGJvb2wgYWRkX2Rpc2NhcmRfYWRkcnMoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLCBzdHJ1Y3QgY3BfY29udHJvbCAqY3BjLA0KPj4gLQkJCQkJCQlib29sIGNoZWNrX29u
bHkpDQo+PiArCQkJCQlib29sIHN5bmNlZCwgYm9vbCBjaGVja19vbmx5KQ0KPj4gICAgew0KPj4g
ICAgCWludCBlbnRyaWVzID0gU0lUX1ZCTE9DS19NQVBfU0laRSAvIHNpemVvZih1bnNpZ25lZCBs
b25nKTsNCj4+ICAgIAlzdHJ1Y3Qgc2VnX2VudHJ5ICpzZSA9IGdldF9zZWdfZW50cnkoc2JpLCBj
cGMtPnRyaW1fc3RhcnQpOw0KPj4gQEAgLTIwOTgsNyArMjA5OCw3IEBAIHN0YXRpYyBib29sIGFk
ZF9kaXNjYXJkX2FkZHJzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGNwX2NvbnRy
b2wgKmNwYywNCj4+ICAgIA0KPj4gICAgCS8qIFNJVF9WQkxPQ0tfTUFQX1NJWkUgc2hvdWxkIGJl
IG11bHRpcGxlIG9mIHNpemVvZih1bnNpZ25lZCBsb25nKSAqLw0KPj4gICAgCWZvciAoaSA9IDA7
IGkgPCBlbnRyaWVzOyBpKyspDQo+PiAtCQlkbWFwW2ldID0gZm9yY2UgPyB+Y2twdF9tYXBbaV0g
JiB+ZGlzY2FyZF9tYXBbaV0gOg0KPj4gKwkJZG1hcFtpXSA9IHN5bmNlZCA/IH5ja3B0X21hcFtp
XSAmIH5kaXNjYXJkX21hcFtpXSA6DQo+IEkgZ3Vlc3MgdGhpcyBjb25kaXRpb24gImZvcmNlID8g
fmNrcHRfbWFwW2ldICYgfmRpc2NhcmRfbWFwW2ldIiBkaWRuJ3QgY292ZXINCj4gYWxsIGJlbG93
IGNhc2VzLCB0aG91Z2h0cz8NCj4gLSBja3B0X21hcFtpXSA9PSAwIC8vIHdyaXRlIGRhdGEsIGFu
ZCB0aGVuIHJlbW92ZSBkYXRhIGJlZm9yZSBjaGVja3BvaW50DQo+IC0gY2twdF9tYXBbaV0gIT0g
MCAvLyByZW1vdmUgZGF0YSBleGlzdGVkIGluIHByZXZpb3VzIGNoZWNrcG9pbnQNCg0KIEZyb20g
dGhlIGhhbmRsaW5nIG9mIGNrcHRfdmFsaWRfbWFwIGluIHVwZGF0ZV9zaXRfZW50cnkoKSwgSSBn
dWVzcyB0aGUgDQpjb25kaXRpb24gY2FuIGNvdmVyIGJvdGggY2FzZXMuDQpGb3IgZXhhbXBsZSwg
d2hlbiB0aGUgY2hlY2twb2ludCBpcyBlbmFibGVkLCBhbGwgdGhlIHNldCBiaXRzIGluIHRoZSAN
CmNrcHRfdmFsaWRfbWFwIHJlbWFpbiBzZXQgYmVmb3JlIHRoZSBjaGVja3BvaW50IChldmVuIHdo
ZW4gdGhlIGJsb2NrcyANCmFyZSBkZWxldGVkKSwgd2hpY2ggbWFrZXMgaXQgZmluZCBhbGwgdGhl
IHJpZ2h0IGJpdHMgaW4gYm90aCBjYXNlcy4NCg0KVGhhbmtzLA0KDQo+DQo+IFRoYW5rcywNCj4N
Cj4+ICAgIAkJCQkoY3VyX21hcFtpXSBeIGNrcHRfbWFwW2ldKSAmIGNrcHRfbWFwW2ldOw0KPj4g
ICAgDQo+PiAgICAJd2hpbGUgKGZvcmNlIHx8IFNNX0koc2JpKS0+ZGNjX2luZm8tPm5yX2Rpc2Nh
cmRzIDw9DQo+PiBAQCAtMzI3NSw3ICszMjc1LDcgQEAgYm9vbCBmMmZzX2V4aXN0X3RyaW1fY2Fu
ZGlkYXRlcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksDQo+PiAgICANCj4+ICAgIAlkb3duX3dy
aXRlKCZTSVRfSShzYmkpLT5zZW50cnlfbG9jayk7DQo+PiAgICAJZm9yICg7IGNwYy0+dHJpbV9z
dGFydCA8PSBjcGMtPnRyaW1fZW5kOyBjcGMtPnRyaW1fc3RhcnQrKykgew0KPj4gLQkJaWYgKGFk
ZF9kaXNjYXJkX2FkZHJzKHNiaSwgY3BjLCB0cnVlKSkgew0KPj4gKwkJaWYgKGFkZF9kaXNjYXJk
X2FkZHJzKHNiaSwgY3BjLCBmYWxzZSwgdHJ1ZSkpIHsNCj4+ICAgIAkJCWhhc19jYW5kaWRhdGUg
PSB0cnVlOw0KPj4gICAgCQkJYnJlYWs7DQo+PiAgICAJCX0NCj4+IEBAIC00NjExLDcgKzQ2MTEs
NyBAQCB2b2lkIGYyZnNfZmx1c2hfc2l0X2VudHJpZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LCBzdHJ1Y3QgY3BfY29udHJvbCAqY3BjKQ0KPj4gICAgCQkJLyogYWRkIGRpc2NhcmQgY2FuZGlk
YXRlcyAqLw0KPj4gICAgCQkJaWYgKCEoY3BjLT5yZWFzb24gJiBDUF9ESVNDQVJEKSkgew0KPj4g
ICAgCQkJCWNwYy0+dHJpbV9zdGFydCA9IHNlZ25vOw0KPj4gLQkJCQlhZGRfZGlzY2FyZF9hZGRy
cyhzYmksIGNwYywgZmFsc2UpOw0KPj4gKwkJCQlhZGRfZGlzY2FyZF9hZGRycyhzYmksIGNwYywg
ZmFsc2UsIGZhbHNlKTsNCj4+ICAgIAkJCX0NCj4+ICAgIA0KPj4gICAgCQkJaWYgKHRvX2pvdXJu
YWwpIHsNCj4+IEBAIC00NjUzLDcgKzQ2NTMsNyBAQCB2b2lkIGYyZnNfZmx1c2hfc2l0X2VudHJp
ZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgY3BfY29udHJvbCAqY3BjKQ0KPj4g
ICAgCQlfX3U2NCB0cmltX3N0YXJ0ID0gY3BjLT50cmltX3N0YXJ0Ow0KPj4gICAgDQo+PiAgICAJ
CWZvciAoOyBjcGMtPnRyaW1fc3RhcnQgPD0gY3BjLT50cmltX2VuZDsgY3BjLT50cmltX3N0YXJ0
KyspDQo+PiAtCQkJYWRkX2Rpc2NhcmRfYWRkcnMoc2JpLCBjcGMsIGZhbHNlKTsNCj4+ICsJCQlh
ZGRfZGlzY2FyZF9hZGRycyhzYmksIGNwYywgdHJ1ZSwgZmFsc2UpOw0KPj4gICAgDQo+PiAgICAJ
CWNwYy0+dHJpbV9zdGFydCA9IHRyaW1fc3RhcnQ7DQo+PiAgICAJfQ0KDQoNCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
